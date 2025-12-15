package com.example.soulsync.model;

import jakarta.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "profiles")
public class Profile {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "profile_id")
    private Long pid; // From your diagram's 'PID' attribute

    // --- From PROFILE Entity Attributes ---

    // Name is a composite attribute in your diagram (FName, LName)
    // We'll make them separate columns
    @Column(name = "first_name")
    private String firstName;

    @Column(name = "last_name")
    private String lastName;

    private String education;

    @Column(name = "monthly_income")
    private Double monthlyIncome;

    private Double height;
    private String gender;

    private LocalDate dob; // Date of Birth

    @Column(name = "photo_url")
    private String photo;

    private String occupation;
    private String religion;
    private String caste;

    /**
     * RELATIONSHIP 1: Created (One-to-One with User)
     * This is the "owning" side.
     * '@JoinColumn' creates the 'user_id' foreign key column in this table.
     * 'unique = true' is CRITICAL: it enforces the 1-to-1 relationship
     * (one profile can only be linked to one user).
     */
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", unique = true, nullable = false)
    @com.fasterxml.jackson.annotation.JsonIgnore // Prevent circular reference
    private User user;

    /**
     * DERIVED ATTRIBUTE: 'Age'
     */
    @Transient // Tells JPA *not* to store this in the database
    public Integer getAge() {
        if (this.dob == null) {
            return null;
        }
        return java.time.Period.between(this.dob, LocalDate.now()).getYears();
    }

    // --- Getters and Setters ---
    // (Add getters and setters for all fields)

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Long getPid() {
        return pid;
    }

    public void setPid(Long pid) {
        this.pid = pid;
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

    public Double getHeight() {
        return height;
    }

    public void setHeight(Double height) {
        this.height = height;
    }

    public LocalDate getDob() {
        return dob;
    }

    public void setDob(LocalDate dob) {
        this.dob = dob;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getOccupation() {
        return occupation;
    }

    public void setOccupation(String occupation) {
        this.occupation = occupation;
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

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}