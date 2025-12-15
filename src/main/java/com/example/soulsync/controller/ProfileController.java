package com.example.soulsync.controller;

import com.example.soulsync.DTO.UserResponse;// Re-use our DTO
import com.example.soulsync.DTO.ProfileUpdateDto;
import com.example.soulsync.model.Profile;
import com.example.soulsync.model.User;
import com.example.soulsync.Repository.UserRepository;
import com.example.soulsync.service.QueryService;
import com.example.soulsync.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

@RestController
@RequestMapping("/api/v1/profiles") // All endpoints here are protected
public class ProfileController {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private UserService userService;
    @Autowired
    private QueryService queryService;

    /**
     * Endpoint for viewing a user's profile.
     * GET /api/v1/profiles/{id}
     */
    @GetMapping("/{id}")
    public ResponseEntity<UserResponse> getProfileById(
            @PathVariable Long id,
            @RequestHeader("User-ID") Long currentUserId) { // Get header for context

        // 3. Use findByIdWithSubscription to get subscription info
        User user = userRepository.findByIdWithSubscription(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "User not found"));

        Integer remainingQueries = null;
        Integer maxQueries = null;

        // 4. ONLY get query counts if the user is viewing THEIR OWN profile
        if (id.equals(currentUserId)) {
            remainingQueries = queryService.getRemainingQueries(user);
            maxQueries = queryService.getMaxQueries(user);
        }

        // 5. Use the NEW static method from your DTO
        // This method correctly sets all fields, including subscription and queries
        UserResponse response = UserResponse.fromUser(user, remainingQueries, maxQueries);

        return ResponseEntity.ok(response);
    }

    @PutMapping("/{id}")
    public ResponseEntity<UserResponse> updateProfile(
            @PathVariable Long id,
            @RequestBody ProfileUpdateDto updateDTO, // <-- Create this DTO
            @RequestHeader("User-ID") Long currentUserId) {

        // Security check: Make sure the user is updating their OWN profile
        if (!id.equals(currentUserId)) {
            throw new ResponseStatusException(HttpStatus.FORBIDDEN, "You can only update your own profile");
        }

        // Call a new service method to do the work
        User updatedUser = userService.updateUserProfile(id, updateDTO);

        // --- ADD THIS LOGIC ---
        // Recalculate query counts for the response
        Integer remainingQueries = queryService.getRemainingQueries(updatedUser);
        Integer maxQueries = queryService.getMaxQueries(updatedUser);

        UserResponse response = UserResponse.fromUser(updatedUser, remainingQueries, maxQueries);
        // Return the updated profile
        return ResponseEntity.ok(response);
    }

/*
    private UserResponse mapUserToResponse(User user) {
        UserResponse res = new UserResponse();
        res.setUserId(user.getUserId());
        res.setEmail(user.getEmail());

        if (user.getProfile() != null) {
            Profile profile = user.getProfile();
            res.setFirstName(profile.getFirstName());
            res.setLastName(profile.getLastName());
            res.setDob(profile.getDob());
            res.setAge(profile.getAge());

            // --- ADD THE NEW MAPPINGS ---
            res.setHeight(profile.getHeight());
            res.setReligion(profile.getReligion());
            res.setCaste(profile.getCaste());
            res.setOccupation(profile.getOccupation());
            res.setMonthlyIncome(profile.getMonthlyIncome());
        }


        return res;
    }

 */
}