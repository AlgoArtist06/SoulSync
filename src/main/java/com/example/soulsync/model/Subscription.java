package com.example.soulsync.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import java.util.Set;

@Entity
@Table(name = "subscriptions")
public class Subscription {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "subscription_id")
    private Long sid;

    @Column(name = "subscription_name", nullable = false, unique = true)
    private String sName;

    private String poc; // Point of Contact
    private Double fees;

    @Column(name = "queries_number")
    private Integer queriesNu;

    @Column(name = "profiles_allowed")
    private Integer profileAllowed;

    public Set<User> getUsers() {
        return users;
    }

    public void setUsers(Set<User> users) {
        this.users = users;
    }

    public Integer getProfileAllowed() {
        return profileAllowed;
    }

    public void setProfileAllowed(Integer profileAllowed) {
        this.profileAllowed = profileAllowed;
    }

    public Integer getQueriesNu() {
        return queriesNu;
    }

    public void setQueriesNu(Integer queriesNu) {
        this.queriesNu = queriesNu;
    }

    public Double getFees() {
        return fees;
    }

    public void setFees(Double fees) {
        this.fees = fees;
    }

    public String getPoc() {
        return poc;
    }

    public void setPoc(String poc) {
        this.poc = poc;
    }

    public String getsName() {
        return sName;
    }

    public void setsName(String sName) {
        this.sName = sName;
    }

    public Long getSid() {
        return sid;
    }

    public void setSid(Long sid) {
        this.sid = sid;
    }

    /**
     * RELATIONSHIP: SUBSCRIBED (One-to-Many)
     * One subscription can be held by many users.
     * 'mappedBy = "subscription"' tells JPA the 'User' class owns this
     * relationship.
     */
    @OneToMany(mappedBy = "subscription")
    @JsonIgnore // Prevent circular reference when serializing to JSON
    private Set<User> users;

    // --- Getters and Setters ---
    // (Add getters and setters)
}