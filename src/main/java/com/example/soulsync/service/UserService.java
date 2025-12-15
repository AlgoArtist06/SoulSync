package com.example.soulsync.service;

import com.example.soulsync.DTO.ProfileUpdateDto;
import com.example.soulsync.DTO.RegistrationRequest;
import com.example.soulsync.Repository.SubscriptionRepository;
import com.example.soulsync.model.Profile;
import com.example.soulsync.model.Subscription;
import com.example.soulsync.model.User;
import com.example.soulsync.Repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
// --- THIS IS THE FIX ---
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private SubscriptionRepository subscriptionRepository;

    // --- THIS IS THE FIX ---
    // Inject the password encoder
    @Autowired
    private PasswordEncoder passwordEncoder;

    @Transactional
    public User registerNewUser(RegistrationRequest request) {

        // Check if email already exists
        if (userRepository.findByEmail(request.getEmail()).isPresent()) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Email is already in use");
        }

        // 1. Create the User entity
        User newUser = new User();
        newUser.setEmail(request.getEmail());

        // --- THIS IS THE FIX ---
        // Hash the password before saving it
        newUser.setPassword(passwordEncoder.encode(request.getPassword()));

        // 2. Create the Profile entity
        Profile newProfile = new Profile();
        newProfile.setFirstName(request.getFirstName());
        newProfile.setLastName(request.getLastName());
        newProfile.setDob(request.getDob());
        newProfile.setGender(request.getGender());
        newProfile.setEducation(request.getEducation());
        newProfile.setMonthlyIncome(request.getMonthlyIncome());
        newProfile.setHeight(request.getHeight());
        newProfile.setPhoto(request.getPhoto()); // photo is not in your DTO, but we'll leave it
        newProfile.setOccupation(request.getOccupation());
        newProfile.setReligion(request.getReligion());
        newProfile.setCaste(request.getCaste());

        // 3. Assign the default "FREE" subscription
        Subscription freeSub = subscriptionRepository.findBySName("FREE")
                .orElseThrow(() -> new RuntimeException("Error: Default 'FREE' subscription not found."));

        newUser.setSubscription(freeSub);

        // 4. Link them together
        newUser.setProfile(newProfile);

        // 5. Save the User
        User savedUser = userRepository.save(newUser);
        return savedUser;
    }

    @Transactional
    public User updateUserProfile(Long userId, ProfileUpdateDto updateDTO) {

        User user = userRepository.findById(userId)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "User not found"));

        Profile profile = user.getProfile();
        if (profile == null) {
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR, "User has no profile to update");
        }

        // Update User entity field(s)
        if (updateDTO.getEmail() != null) {
            user.setEmail(updateDTO.getEmail());
        }

        // Update Profile entity fields
        if (updateDTO.getFirstName() != null) {
            profile.setFirstName(updateDTO.getFirstName());
        }
        if (updateDTO.getLastName() != null) {
            profile.setLastName(updateDTO.getLastName());
        }
        if (updateDTO.getDob() != null) {
            profile.setDob(updateDTO.getDob());
        }
        if (updateDTO.getGender() != null) {
            profile.setGender(updateDTO.getGender());
        }
        if (updateDTO.getEducation() != null) {
            profile.setEducation(updateDTO.getEducation());
        }
        if (updateDTO.getHeight() != null) {
            profile.setHeight(updateDTO.getHeight());
        }
        if (updateDTO.getReligion() != null) {
            profile.setReligion(updateDTO.getReligion());
        }
        if (updateDTO.getCaste() != null) {
            profile.setCaste(updateDTO.getCaste());
        }
        if (updateDTO.getOccupation() != null) {
            profile.setOccupation(updateDTO.getOccupation());
        }
        if (updateDTO.getMonthlyIncome() != null) {
            profile.setMonthlyIncome(updateDTO.getMonthlyIncome());
        }

        return userRepository.save(user);
    }
}