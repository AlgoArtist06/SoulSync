package com.example.soulsync.controller;

import com.example.soulsync.DTO.SearchRequest;
import com.example.soulsync.DTO.UserResponse;
import com.example.soulsync.Repository.UserRepository;
import com.example.soulsync.model.User;
import com.example.soulsync.service.MatchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/v1/matches")
public class MatchController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private MatchService matchService;

    /**
     * Get profile matches for the logged-in user.
     * Limited by their subscription's profileAllowed count.
     */
    @GetMapping
    public ResponseEntity<List<UserResponse>> getMatches(Authentication authentication) {
        // Get the logged-in user
        String userEmail = authentication.getName();
        User user = userRepository.findByEmail(userEmail)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.UNAUTHORIZED, "Invalid user token"));

        // Get subscription limit
        int profileLimit = user.getSubscription() != null ? user.getSubscription().getProfileAllowed() : 3;

        // Handle unlimited (-1)
        if (profileLimit < 0) {
            profileLimit = Integer.MAX_VALUE;
        }

        // Find matches
        List<User> matches = matchService.findMatches(user, profileLimit);

        // Convert to DTOs
        List<UserResponse> matchResponses = matches.stream()
                .map(match -> UserResponse.fromUser(match, 0, 0)) // Query counts not needed for matches
                .collect(Collectors.toList());

        return ResponseEntity.ok(matchResponses);
    }

    /**
     * Search profiles with user-defined criteria.
     * Limited by their subscription's profileAllowed count.
     */
    @PostMapping("/search")
    public ResponseEntity<List<UserResponse>> searchProfiles(
            Authentication authentication,
            @RequestBody SearchRequest searchRequest) {
        // Get the logged-in user
        String userEmail = authentication.getName();
        User user = userRepository.findByEmail(userEmail)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.UNAUTHORIZED, "Invalid user token"));

        // Get subscription limit
        int profileLimit = user.getSubscription() != null ? user.getSubscription().getProfileAllowed() : 3;

        // Handle unlimited (-1)
        if (profileLimit < 0) {
            profileLimit = Integer.MAX_VALUE;
        }

        // Enforce gender filter based on logged-in user
        if (user.getProfile() != null && user.getProfile().getGender() != null) {
            String userGender = user.getProfile().getGender();
            if (userGender.equalsIgnoreCase("Male")) {
                searchRequest.setGender("Female");
            } else if (userGender.equalsIgnoreCase("Female")) {
                searchRequest.setGender("Male");
            }
        }

        // Search profiles
        List<User> results = matchService.searchProfiles(user, searchRequest, profileLimit);

        // Convert to DTOs
        List<UserResponse> resultResponses = results.stream()
                .map(match -> UserResponse.fromUser(match, 0, 0))
                .collect(Collectors.toList());

        return ResponseEntity.ok(resultResponses);
    }
}
