package com.example.soulsync.Repository;

import com.example.soulsync.model.ActivityLog;
import com.example.soulsync.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Repository
public interface ActivityLogRepository extends JpaRepository<ActivityLog, Long> {
    // Example of a custom query method
    @Query("SELECT a FROM ActivityLog a WHERE a.user = :user")
    List<ActivityLog> findByUser(@Param("user") User user);

    // --- ADD THIS METHOD ---
    /**
     * Counts how many logs a user has created after a specific time.
     * We will use this to count today's queries.
     */
    // long countByUserAndDateAfter(User user, LocalDateTime timestamp);
    // Optional<ActivityLog> findByUserAndDateBetween(User user, LocalDateTime
    // start, LocalDateTime end);
    // REMOVED due to type mismatch. Use findByUserAndDate instead.
    @Query("SELECT a FROM ActivityLog a WHERE a.user = :user AND a.date = :date")
    Optional<ActivityLog> findByUserAndDate(@Param("user") User user, @Param("date") LocalDate date);
}