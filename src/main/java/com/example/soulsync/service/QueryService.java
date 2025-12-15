package com.example.soulsync.service;

import com.example.soulsync.model.ActivityLog;
import com.example.soulsync.model.Subscription;
import com.example.soulsync.model.User;
import com.example.soulsync.Repository.ActivityLogRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.Optional;

@Service
public class QueryService {

    @Autowired
    private ActivityLogRepository activityLogRepository;

    private ActivityLog getOrCreateLog(User user, LocalDate date) {
        Optional<ActivityLog> logOptional = activityLogRepository.findByUserAndDate(user, date);

        if (logOptional.isPresent()) {
            return logOptional.get();
        } else {
            ActivityLog newLog = new ActivityLog();
            newLog.setUser(user);
            newLog.setDate(date);
            newLog.setQueriesNo(0);
            return activityLogRepository.save(newLog);
        }
    }

    /**
     * Gets the maximum daily queries for a user.
     */
    public int getMaxQueries(User user) {
        Subscription subscription = user.getSubscription();

        // Default for free users
        if (subscription == null || subscription.getQueriesNu() == null) {
            return 10;
        }

        // Returns the actual value (e.g., 100, or 0 for unlimited)
        return subscription.getQueriesNu();
    }

    /**
     * Calculates the number of remaining queries for a user for today.
     */
    public int getRemainingQueries(User user) {
        int maxQueries = getMaxQueries(user);

        // 0 or less means unlimited
        if (maxQueries <= 0) {
            return 9999; // Return a large "unlimited" number
        }

        ActivityLog log = getOrCreateLog(user, LocalDate.now());

        Integer usedQueries = log.getQueriesNo();
        if (usedQueries == null) {
            usedQueries = 0;
        }

        return Math.max(0, maxQueries - usedQueries);
    }

    /**
     * Increments the query count for a user.
     */
    @Transactional
    public void incrementQueryCount(User user) {
        int maxQueries = getMaxQueries(user);

        // 0 or less means unlimited, so we don't need to log their usage
        if (maxQueries <= 0) {
            return;
        }

        ActivityLog log = getOrCreateLog(user, LocalDate.now());

        Integer currentQueries = log.getQueriesNo();
        if (currentQueries == null) {
            currentQueries = 0;
        }

        log.setQueriesNo(currentQueries + 1);
        activityLogRepository.save(log);
    }
}