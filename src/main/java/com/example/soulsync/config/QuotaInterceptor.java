package com.example.soulsync.config;

import com.example.soulsync.model.ActivityLog;
import com.example.soulsync.model.Subscription;
import com.example.soulsync.model.User;
import com.example.soulsync.Repository.ActivityLogRepository;
import com.example.soulsync.Repository.UserRepository;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.Optional;

/**
 * Interceptor to check user's query quota.
 * This now securely gets the user from the SecurityContext
 * and updates one log row per day.
 */
@Component
public class QuotaInterceptor implements HandlerInterceptor {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ActivityLogRepository activityLogRepository;

    /**
     * This method runs BEFORE the controller.
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {

        // --- Step 1: Securely get the logged-in user ---
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication == null || !authentication.isAuthenticated()) {
            response.sendError(HttpStatus.UNAUTHORIZED.value(), "User is not authenticated");
            return false;
        }

        String userEmail = authentication.getName();
        User user = userRepository.findByEmail(userEmail).orElse(null);
        if (user == null) {
            response.sendError(HttpStatus.UNAUTHORIZED.value(), "Invalid user");
            return false;
        }

        // --- Step 2: Get full user details (to avoid LazyInit) ---
        // We must fetch the user *with* their subscription
        User userWithSub = userRepository.findByIdWithSubscription(user.getUserId())
                .orElseThrow(() -> new RuntimeException("Could not find user " + user.getUserId()));

        Subscription sub = userWithSub.getSubscription();
        if (sub == null) {
            response.sendError(HttpStatus.FORBIDDEN.value(), "User has no subscription");
            return false;
        }

        Integer queryLimit = sub.getQueriesNu();

        // --- Step 3: Check for unlimited queries ---
        if (queryLimit < 0) { // e.g., -1 for VIP
            request.setAttribute("user", userWithSub); // Pass user to controller
            return true; // Let them pass, no logging needed
        }

        // --- Step 4: Get Current Usage (One Log Per Day logic) ---
        // Find the *single log row* for today
        Optional<ActivityLog> todayLog = activityLogRepository.findByUserAndDate(userWithSub, LocalDate.now());

        long todayUsage = 0;
        if (todayLog.isPresent()) {
            todayUsage = todayLog.get().getQueriesNo();
        }

        // --- Step 5: Compare and Decide ---
        if (todayUsage >= queryLimit) {
            response.setStatus(HttpStatus.TOO_MANY_REQUESTS.value());
            response.setContentType("application/json");
            response.getWriter().write(String.format(
                    "{\"error\": \"Daily query limit exceeded\", \"limit\": %d, \"used\": %d}",
                    queryLimit, todayUsage));
            return false; // Block request
        }

        // --- Step 6: Save for postHandle ---
        // We pass the user AND today's log to postHandle
        request.setAttribute("user", userWithSub);
        request.setAttribute("todayLog", todayLog); // Pass the Optional log

        return true; // Let them pass
    }

    /**
     * This method runs AFTER the controller is successful.
     */
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception {

        // Only log if the request was successful
        if (response.getStatus() >= 200 && response.getStatus() < 300) {

            // Get the objects we saved in preHandle
            User user = (User) request.getAttribute("user");
            Optional<ActivityLog> todayLog = (Optional<ActivityLog>) request.getAttribute("todayLog");

            if (user == null) {
                return; // Should not happen
            }

            // Check if user has an unlimited plan (e.g., < 0)
            if (user.getSubscription().getQueriesNu() < 0) {
                return; // Don't log for unlimited users
            }

            // --- NEW LOGIC: Update or Create ---
            ActivityLog log;
            if (todayLog.isPresent()) {
                // 1. UPDATE existing log
                log = todayLog.get();
                log.setQueriesNo(log.getQueriesNo() + 1); // Increment count
            } else {
                // 2. CREATE new log for today
                log = new ActivityLog();
                log.setUser(user);
                log.setDate(LocalDate.now());
                log.setQueriesNo(1); // This is the first query of the day
            }

            // --- FIX: Use saveAndFlush to commit immediately ---
            activityLogRepository.saveAndFlush(log);
        }
    }
}