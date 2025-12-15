package com.example.soulsync.model;

import jakarta.persistence.*;
import java.time.LocalDate; // <-- CHANGED from LocalDateTime

@Entity
@Table(name = "activity_logs", uniqueConstraints = {
        // This ensures you can only have one row for a user on a specific date
        @UniqueConstraint(columnNames = {"user_id", "activity_date"})
})
public class ActivityLog {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long logId;

    @Column(name = "activity_date", nullable = false)
    private LocalDate date; // <-- CHANGED from LocalDateTime

    @Column(name = "queries_number", nullable = false)
    private Integer queriesNo;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    // --- Getters and Setters ---
    // (These now match your names)

    public Long getLogId() {
        return logId;
    }

    public void setLogId(Long logId) {
        this.logId = logId;
    }

    public LocalDate getDate() { // <-- CHANGED
        return date;
    }

    public void setDate(LocalDate date) { // <-- CHANGED
        this.date = date;
    }

    public Integer getQueriesNo() {
        return queriesNo;
    }

    public void setQueriesNo(Integer queriesNo) {
        this.queriesNo = queriesNo;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}