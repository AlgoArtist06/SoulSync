package com.example.soulsync.controller;

import com.example.soulsync.Repository.ProfileRepository;
import com.example.soulsync.Repository.UserRepository;
import com.example.soulsync.DTO.UserResponse;
import com.example.soulsync.model.Profile;
import com.example.soulsync.model.User;
import com.example.soulsync.service.ProfileSpecification;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/v1/search")
public class SearchController {

    @Autowired
    private ProfileRepository profileRepository;

    @Autowired
    private UserRepository userRepository; // Need this to find the user from email

    @Autowired
    private ProfileSpecification profileSpecification;

    /**
     * Endpoint for searching profiles based on dynamic criteria.
     * This is protected by your QuotaInterceptor.
     */
    @GetMapping
    public ResponseEntity<List<UserResponse>> searchProfiles(
            Authentication authentication, // Get user securely from JWT
            @RequestParam(required = false) String gender,
            @RequestParam(required = false) String education,
            @RequestParam(required = false) String occupation,
            @RequestParam(required = false) String religion,
            @RequestParam(required = false) String caste,
            @RequestParam(required = false) Double minIncome
    ) {

        // 1. Get the User object from the authentication token
        String authEmail = authentication.getName();
        User currentUser = userRepository.findByEmail(authEmail)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.UNAUTHORIZED, "Invalid user token"));

        Long currentUserId = currentUser.getUserId();

        // 2. Create a list for our 'AND' conditions
        List<Specification<Profile>> specs = new ArrayList<>();

        // 3. ALWAYS ADD THIS: Exclude the current user from results
        specs.add(profileSpecification.isNotUser(currentUserId));

        // 4. Add other pieces to the query only if provided
        if (gender != null && !gender.isEmpty()) {
            specs.add(profileSpecification.hasGender(gender));
        }
        if (education != null && !education.isEmpty()) {
            specs.add(profileSpecification.hasEducation(education));
        }
        if (occupation != null && !occupation.isEmpty()) {
            specs.add(profileSpecification.hasOccupation(occupation));
        }
        if (religion != null && !religion.isEmpty()) {
            specs.add(profileSpecification.hasReligion(religion));
        }
        if (caste != null && !caste.isEmpty()) {
            specs.add(profileSpecification.hasCaste(caste));
        }
        if (minIncome != null) {
            specs.add(profileSpecification.incomeGreaterThanOrEqual(minIncome));
        }

        // 5. Combine all specs with AND
        Specification<Profile> finalSpec = Specification.allOf(specs);

        // 6. Execute the query
        List<Profile> foundProfiles = profileRepository.findAll(finalSpec);

        // 7. Map the results to DTOs
        List<UserResponse> response = foundProfiles.stream()
                .map(profile -> UserResponse.fromUser(profile.getUser()))
                .collect(Collectors.toList());

        return ResponseEntity.ok(response);
    }
}