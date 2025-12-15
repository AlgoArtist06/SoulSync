package com.example.soulsync.service;

import com.example.soulsync.model.Profile;
import com.example.soulsync.model.User;
import jakarta.persistence.criteria.Join;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

@Service
public class ProfileSpecification {

    /**
     * Creates a specification piece to exclude a specific user ID.
     */
    public Specification<Profile> isNotUser(Long userId) {
        return (root, query, criteriaBuilder) -> {
            // Join Profile with User to find the user_id
            Join<Profile, User> userJoin = root.join("user");
            // Add a "WHERE user.userId != <currentUserId>" clause
            return criteriaBuilder.notEqual(userJoin.get("userId"), userId);
        };
    }
    // --- NEW SPECIFICATION ---
    /**
     * Creates a specification piece for matching 'gender'.
     */
    public Specification<Profile> hasGender(String gender) {
        return (root, query, criteriaBuilder) -> {
            // This creates: "WHERE gender = '...'"
            return criteriaBuilder.equal(root.get("gender"), gender);
        };
    }
    // --- THIS IS THE NEW METHOD ---
    /**
     * Creates a specification piece for matching 'education' (case-insensitive)
     */
    public Specification<Profile> hasEducation(String education) {
        return (root, query, criteriaBuilder) -> {
            // This creates: "WHERE LOWER(education) LIKE '%...%'"
            return criteriaBuilder.like(criteriaBuilder.lower(root.get("education")), "%" + education.toLowerCase() + "%");
        };
    }

    /**
     * Creates a specification piece for matching 'caste'.
     */
    public Specification<Profile> hasCaste(String caste) {
        return (root, query, criteriaBuilder) -> {
            return criteriaBuilder.equal(root.get("caste"), caste);
        };
    }

    /**
     * Creates a specification piece for matching 'religion'.
     */
    public Specification<Profile> hasReligion(String religion) {
        return (root, query, criteriaBuilder) -> {
            return criteriaBuilder.equal(root.get("religion"), religion);
        };
    }

    /**
     * Creates a specification piece for matching 'occupation'.
     */
    public Specification<Profile> hasOccupation(String occupation) {
        return (root, query, criteriaBuilder) -> {
            return criteriaBuilder.like(root.get("occupation"), "%" + occupation + "%");
        };
    }

    /**
     * Creates a specification piece for 'monthlyIncome' >= a value.
     */
    public Specification<Profile> incomeGreaterThanOrEqual(Double income) {
        return (root, query, criteriaBuilder) -> {
            return criteriaBuilder.greaterThanOrEqualTo(root.get("monthlyIncome"), income);
        };
    }
}