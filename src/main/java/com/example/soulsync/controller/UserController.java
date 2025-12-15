package com.example.soulsync.controller;

import com.example.soulsync.Repository.ActivityLogRepository;
import com.example.soulsync.Repository.SubscriptionRepository;
import com.example.soulsync.Repository.UserRepository;
import com.example.soulsync.DTO.ProfileUpdateDto;
import com.example.soulsync.DTO.SubscriptionUpdate;
import com.example.soulsync.DTO.UserResponse;
import com.example.soulsync.model.ActivityLog;
import com.example.soulsync.model.Subscription;
import com.example.soulsync.model.User;
import com.example.soulsync.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.Optional;

@RestController
@RequestMapping("/api/v1/users")
public class UserController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private SubscriptionRepository subscriptionRepository;

    @Autowired
    private ActivityLogRepository activityLogRepository;

    @Autowired
    private UserService userService;

    /**
     * Endpoint to get the logged-in user's full profile data.
     * This is called on login and when viewing "My Profile".
     */
    @GetMapping("/{id}")
    public ResponseEntity<UserResponse> getUserById(@PathVariable Long id, Authentication authentication) {
        // 1. Get the currently logged-in user's email from the token
        String authEmail = authentication.getName();

        // 2. Find the user from the token
        User authUser = userRepository.findByEmail(authEmail)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.UNAUTHORIZED, "Invalid token"));

        // 3. Security Check: Ensure the user is only requesting their *own* data
        if (!authUser.getUserId().equals(id)) {
            throw new ResponseStatusException(HttpStatus.FORBIDDEN, "You are not authorized to view this profile");
        }

        // 4. Build the rich UserResponse with query counts
        UserResponse response = buildUserResponse(authUser);
        return ResponseEntity.ok(response);
    }

    /**
     * Endpoint for a user to update their subscription.
     */
    @PostMapping("/subscription")
    public ResponseEntity<UserResponse> updateUserSubscription(
            Authentication authentication, // Get user securely from token
            @RequestBody SubscriptionUpdate dto) {
        // 1. Get the user from the token
        User user = getUserFromAuthentication(authentication);

        // 2. Find the new subscription plan
        Subscription newSubscription = subscriptionRepository.findById(dto.getNewSubscriptionId())
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Subscription plan not found"));

        // 3. Update and save the user
        user.setSubscription(newSubscription);
        User savedUser = userRepository.save(user);

        // 4. Return the updated user data (with new query counts)
        UserResponse response = buildUserResponse(savedUser);
        return ResponseEntity.ok(response);
    }

    /**
     * Endpoint for a user to update their own profile information.
     */
    @PutMapping("/profile")
    public ResponseEntity<UserResponse> updateUserProfile(
            Authentication authentication, // Get user securely
            @RequestBody ProfileUpdateDto profileUpdateDto) {
        // 1. Get user ID from token
        Long userId = getUserFromAuthentication(authentication).getUserId();

        // 2. Call the service to perform the update
        User updatedUser = userService.updateUserProfile(userId, profileUpdateDto);

        // 3. Return the updated user
        UserResponse response = buildUserResponse(updatedUser);
        return ResponseEntity.ok(response);
    }

    /**
     * Endpoint to 'Connect' with (Like) another user.
     */
    @PostMapping("/{id}/like")
    public ResponseEntity<UserResponse> likeUser(@PathVariable Long id, Authentication authentication) {
        User currentUser = getUserFromAuthentication(authentication);
        User userToLike = userRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "User to like not found"));

        if (currentUser.getUserId().equals(id)) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "You cannot like yourself.");
        }

        currentUser.getLikedUsers().add(userToLike);
        User savedUser = userRepository.save(currentUser);

        // Return updated user data with fresh query counts
        UserResponse response = buildUserResponse(savedUser);
        return ResponseEntity.ok(response);
    }

    /**
     * Endpoint to 'Unlike' (Remove) a user from the liked list.
     */
    @DeleteMapping("/{id}/like")
    public ResponseEntity<UserResponse> unlikeUser(@PathVariable Long id, Authentication authentication) {
        User currentUser = getUserFromAuthentication(authentication);
        User userToUnlike = userRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "User to unlike not found"));

        if (currentUser.getLikedUsers().contains(userToUnlike)) {
            currentUser.getLikedUsers().remove(userToUnlike);
            User savedUser = userRepository.save(currentUser);

            // Return updated user data
            UserResponse response = buildUserResponse(savedUser);
            return ResponseEntity.ok(response);
        } else {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "User not found in your likes.");
        }
    }

    /**
     * Endpoint to get the list of users the current user has liked.
     */
    @GetMapping("/likes")
    public ResponseEntity<java.util.Set<UserResponse>> getLikedUsers(Authentication authentication) {
        User currentUser = getUserFromAuthentication(authentication);

        // Force initialization of the lazy-loaded collection if needed,
        // though usually accessing it within the transaction (Service layer) is safer.
        // Since we are in Controller and using Repository directly, we rely on
        // OpenEntityManagerInView
        // or we might need to fetch eagerly.
        // However, let's try mapping directly.

        java.util.Set<UserResponse> likedProfiles = new java.util.HashSet<>();
        for (User likedUser : currentUser.getLikedUsers()) {
            // For the list view, we might not need query counts, so passing null/0 is fine
            // or we can fetch them if we want to show them in the card.
            // For now, let's just show profile data.
            likedProfiles.add(UserResponse.fromUser(likedUser, null, null));
        }

        return ResponseEntity.ok(likedProfiles);
    }

    // --- HELPER METHODS ---

    /**
     * Helper to safely get the User object from the security context.
     */
    private User getUserFromAuthentication(Authentication authentication) {
        String userEmail = authentication.getName();
        return userRepository.findByEmail(userEmail)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.UNAUTHORIZED, "Invalid user token"));
    }

    /**
     * Helper to build the complete UserResponse, including query counts.
     */
    private UserResponse buildUserResponse(User user) {
        int maxQueries = user.getSubscription().getQueriesNu();
        int remainingQueries;

        if (maxQueries < 0) {
            remainingQueries = -1; // -1 represents "unlimited"
        } else {
            Optional<ActivityLog> todayLog = activityLogRepository.findByUserAndDate(user, LocalDate.now());

            int usedQueries = todayLog.map(ActivityLog::getQueriesNo).orElse(0);
            remainingQueries = maxQueries - usedQueries;
        }

        // Use the DTO's static method to create the response
        return UserResponse.fromUser(user, remainingQueries, maxQueries);
    }
}