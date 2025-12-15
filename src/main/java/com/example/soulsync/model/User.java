package com.example.soulsync.model;

import jakarta.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "users")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_id")
    private Long userId;

    @Column(nullable = false, unique = true)
    private String email;

    @Column(nullable = false)
    private String password;

    // --- RELATIONSHIPS ---

    /**
     * RELATIONSHIP 1: Created (One-to-One with Profile)
     * 'mappedBy = "user"' means the 'user' field in the 'Profile' class
     * is the "owner" of this relationship.
     * 'cascade = CascadeType.ALL' means if you save/delete a User,
     * its associated Profile will also be saved/deleted.
     */
    @OneToOne(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private Profile profile;

    /**
     * RELATIONSHIP 2: SUBSCRIBED (Many-to-One)
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "subscription_id")
    private Subscription subscription;

    /**
     * RELATIONSHIP 3: Activity (One-to-Many)
     */
    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Set<ActivityLog> activityLogs = new HashSet<>();

    /**
     * RELATIONSHIP 4: LIKES (Many-to-Many)
     */
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "user_likes", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "liked_user_id"))
    private Set<User> likedUsers = new HashSet<>();

    @ManyToMany(mappedBy = "likedUsers", fetch = FetchType.LAZY)
    private Set<User> likedByUsers = new HashSet<>();

    public Subscription getSubscription() {
        return subscription;
    }

    public void setSubscription(Subscription subscription) {
        this.subscription = subscription;
    }

    public Set<ActivityLog> getActivityLogs() {
        return activityLogs;
    }

    public void setActivityLogs(Set<ActivityLog> activityLogs) {
        this.activityLogs = activityLogs;
    }

    public Set<User> getLikedUsers() {
        return likedUsers;
    }

    public void setLikedUsers(Set<User> likedUsers) {
        this.likedUsers = likedUsers;
    }

    public Set<User> getLikedByUsers() {
        return likedByUsers;
    }

    public void setLikedByUsers(Set<User> likedByUsers) {
        this.likedByUsers = likedByUsers;
    }

    // --- Helper method to link profile ---
    // This ensures both sides of the relationship are set correctly
    public void setProfile(Profile profile) {
        if (profile != null) {
            profile.setUser(this); // Set the 'user' field in Profile
        }
        this.profile = profile;
    }

    // --- Getters and Setters ---
    // (Add getters and setters for all fields: userId, email, password, profile,
    // etc.)

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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Profile getProfile() {
        return profile;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o)
            return true;
        if (o == null || getClass() != o.getClass())
            return false;
        User user = (User) o;
        return userId != null && userId.equals(user.userId);
    }

    @Override
    public int hashCode() {
        return getClass().hashCode();
    }
}