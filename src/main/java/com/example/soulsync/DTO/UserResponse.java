package com.example.soulsync.DTO; // FIX: Corrected package name to lowercase 'dto'

import com.example.soulsync.model.Profile;
import com.example.soulsync.model.User;

import java.time.LocalDate;

/**
 * A standard DTO for returning user data safely.
 * (NOW UPDATED WITH FULL PROFILE DETAILS AND QUERY COUNTS)
 */
public class UserResponse {

    // --- Basic User Info ---
    private Long userId;
    private String email;
    private String subscriptionName;

    // --- Profile Info ---
    private String firstName;
    private String lastName;
    private String gender; // Added
    private LocalDate dob;
    private Integer age;
    private Double height;
    private String religion;
    private String caste;
    private String occupation;
    private String education; // Added
    private Double monthlyIncome;

    // --- NEWLY ADDED FIELDS for Query Counts ---
    private Integer remainingQueries;
    private Integer maxQueries;

    // Constructors
    public UserResponse() {
    }

    /**
     * OLD METHOD: Helper method to map a User/Profile to this DTO.
     * We keep this for any code that doesn't need query counts.
     */
    public static UserResponse fromUser(User user) {
        // This just calls the new method with nulls for query counts
        return fromUser(user, null, null);
    }

    /**
     * NEW METHOD: Helper method to map a User/Profile AND query counts to this DTO
     */
    public static UserResponse fromUser(User user, Integer remaining, Integer max) {
        UserResponse res = new UserResponse();

        // Map User fields
        res.setUserId(user.getUserId());
        res.setEmail(user.getEmail());

        // Map Subscription name
        if (user.getSubscription() != null) {
            res.setSubscriptionName(user.getSubscription().getsName()); // Corrected from getsName()
        } else {
            res.setSubscriptionName("Free Tier"); // Default
        }

        // Map Profile fields
        if (user.getProfile() != null) {
            Profile profile = user.getProfile();
            res.setFirstName(profile.getFirstName());
            res.setLastName(profile.getLastName());
            res.setGender(profile.getGender()); // Added
            res.setDob(profile.getDob());
            res.setAge(profile.getAge());
            res.setHeight(profile.getHeight());
            res.setReligion(profile.getReligion());
            res.setCaste(profile.getCaste());
            res.setOccupation(profile.getOccupation());
            res.setEducation(profile.getEducation()); // Added
            res.setMonthlyIncome(profile.getMonthlyIncome());
        }

        // --- SET NEW FIELDS ---
        res.setRemainingQueries(remaining);
        res.setMaxQueries(max);

        return res;
    }

    // --- Getters and Setters ---
    // (Includes getters/setters for new fields)

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSubscriptionName() {
        return subscriptionName;
    }

    public void setSubscriptionName(String subscriptionName) {
        this.subscriptionName = subscriptionName;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public LocalDate getDob() {
        return dob;
    }

    public void setDob(LocalDate dob) {
        this.dob = dob;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public Double getHeight() {
        return height;
    }

    public void setHeight(Double height) {
        this.height = height;
    }

    public String getReligion() {
        return religion;
    }

    public void setReligion(String religion) {
        this.religion = religion;
    }

    public String getCaste() {
        return caste;
    }

    public void setCaste(String caste) {
        this.caste = caste;
    }

    public String getOccupation() {
        return occupation;
    }

    public void setOccupation(String occupation) {
        this.occupation = occupation;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public Double getMonthlyIncome() {
        return monthlyIncome;
    }

    public void setMonthlyIncome(Double monthlyIncome) {
        this.monthlyIncome = monthlyIncome;
    }

    // --- GETTERS/SETTERS FOR NEW FIELDS ---

    public Integer getRemainingQueries() {
        return remainingQueries;
    }

    public void setRemainingQueries(Integer remainingQueries) {
        this.remainingQueries = remainingQueries;
    }

    public Integer getMaxQueries() {
        return maxQueries;
    }

    public void setMaxQueries(Integer maxQueries) {
        this.maxQueries = maxQueries;
    }
}