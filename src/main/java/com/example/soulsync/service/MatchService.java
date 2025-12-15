package com.example.soulsync.service;

import com.example.soulsync.DTO.SearchRequest;
import com.example.soulsync.Repository.UserRepository;
import com.example.soulsync.model.Profile;
import com.example.soulsync.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.Period;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Service
public class MatchService {

    @Autowired
    private UserRepository userRepository;

    /**
     * Find matches for a given user based on profile preferences.
     * Matching criteria:
     * - Opposite gender
     * - Same religion
     * - Similar age (+/- 5 years)
     * - Compatible education level
     * - Monthly income within reasonable range
     */
    public List<User> findMatches(User currentUser, int limit) {
        Profile userProfile = currentUser.getProfile();
        if (userProfile == null) {
            return List.of(); // No profile, no matches
        }

        // Get IDs of users already liked by the current user
        Set<Long> likedUserIds = currentUser.getLikedUsers().stream()
                .map(User::getUserId)
                .collect(Collectors.toSet());

        // Get all users except current user and already liked users
        List<User> allUsers = userRepository.findAll().stream()
                .filter(u -> !u.getUserId().equals(currentUser.getUserId()))
                .filter(u -> !likedUserIds.contains(u.getUserId()))
                .filter(u -> u.getProfile() != null)
                .collect(Collectors.toList());

        // Calculate user's age
        int userAge = userProfile.getAge() != null ? userProfile.getAge()
                : (userProfile.getDob() != null ? Period.between(userProfile.getDob(), LocalDate.now()).getYears() : 0);

        // Filter and score matches
        List<User> matches = allUsers.stream()
                .filter(user -> {
                    Profile profile = user.getProfile();

                    // Gender filter: opposite gender
                    if (userProfile.getGender() != null && profile.getGender() != null) {
                        if (userProfile.getGender().equalsIgnoreCase(profile.getGender())) {
                            return false;
                        }
                    }

                    // Religion filter: same religion
                    if (userProfile.getReligion() != null && profile.getReligion() != null) {
                        if (!userProfile.getReligion().equalsIgnoreCase(profile.getReligion())) {
                            return false;
                        }
                    }

                    // Age filter: +/- 5 years
                    if (profile.getAge() != null && userAge > 0) {
                        int ageDiff = Math.abs(profile.getAge() - userAge);
                        if (ageDiff > 5) {
                            return false;
                        }
                    }

                    return true;
                })
                .limit(limit)
                .collect(Collectors.toList());

        return matches;
    }

    /**
     * Search profiles based on user-defined criteria.
     * Applies filters dynamically based on what the user provides.
     */
    public List<User> searchProfiles(User currentUser, SearchRequest searchRequest, int limit) {
        // Get IDs of users already liked by the current user
        Set<Long> likedUserIds = currentUser.getLikedUsers().stream()
                .map(User::getUserId)
                .collect(Collectors.toSet());

        // Get all users except current user and already liked users
        List<User> allUsers = userRepository.findAll().stream()
                .filter(u -> !u.getUserId().equals(currentUser.getUserId()))
                .filter(u -> !likedUserIds.contains(u.getUserId()))
                .filter(u -> u.getProfile() != null)
                .collect(Collectors.toList());

        // Apply filters dynamically
        List<User> results = allUsers.stream()
                .filter(user -> {
                    Profile profile = user.getProfile();

                    // Gender filter
                    if (searchRequest.getGender() != null && !searchRequest.getGender().isEmpty()
                            && !searchRequest.getGender().equalsIgnoreCase("Any")) {
                        if (profile.getGender() == null
                                || !profile.getGender().equalsIgnoreCase(searchRequest.getGender())) {
                            return false;
                        }
                    }

                    // Religion filter
                    if (searchRequest.getReligion() != null && !searchRequest.getReligion().isEmpty()
                            && !searchRequest.getReligion().equalsIgnoreCase("Any")) {
                        if (profile.getReligion() == null
                                || !profile.getReligion().equalsIgnoreCase(searchRequest.getReligion())) {
                            return false;
                        }
                    }

                    // Age filter
                    if (profile.getAge() != null) {
                        if (searchRequest.getMinAge() != null && profile.getAge() < searchRequest.getMinAge()) {
                            return false;
                        }
                        if (searchRequest.getMaxAge() != null && profile.getAge() > searchRequest.getMaxAge()) {
                            return false;
                        }
                    }

                    // Education filter
                    if (searchRequest.getEducation() != null && !searchRequest.getEducation().isEmpty()
                            && !searchRequest.getEducation().equalsIgnoreCase("Any")) {
                        if (profile.getEducation() == null
                                || !profile.getEducation().equalsIgnoreCase(searchRequest.getEducation())) {
                            return false;
                        }
                    }

                    // Income filter
                    if (profile.getMonthlyIncome() != null) {
                        if (searchRequest.getMinIncome() != null
                                && profile.getMonthlyIncome() < searchRequest.getMinIncome()) {
                            return false;
                        }
                        if (searchRequest.getMaxIncome() != null
                                && profile.getMonthlyIncome() > searchRequest.getMaxIncome()) {
                            return false;
                        }
                    }

                    // Height filter
                    if (profile.getHeight() != null) {
                        if (searchRequest.getMinHeight() != null
                                && profile.getHeight() < searchRequest.getMinHeight()) {
                            return false;
                        }
                        if (searchRequest.getMaxHeight() != null
                                && profile.getHeight() > searchRequest.getMaxHeight()) {
                            return false;
                        }
                    }

                    return true;
                })
                .limit(limit)
                .collect(Collectors.toList());

        return results;
    }
}
