package com.example.soulsync.controller;

import com.example.soulsync.Repository.ActivityLogRepository;
import com.example.soulsync.Repository.UserRepository;
import com.example.soulsync.DTO.AuthResponse;
import com.example.soulsync.DTO.LoginRequest;
import com.example.soulsync.DTO.RegistrationRequest;
import com.example.soulsync.DTO.UserResponse;
import com.example.soulsync.model.ActivityLog;
import com.example.soulsync.model.User;
import com.example.soulsync.security.JwtUtil;
import com.example.soulsync.security.UserDetailsServiceImpl;
import com.example.soulsync.service.UserService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

@RestController
@RequestMapping("/api/v1/auth")
public class AuthController {

    @Autowired
    private UserService userService;

    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private UserDetailsServiceImpl userDetailsService;

    @Autowired
    private JwtUtil jwtUtil;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ActivityLogRepository activityLogRepository;

    /**
     * TESTING ONLY: Verify password encoder is working
     */
    @Autowired
    private PasswordEncoder passwordEncoder;

    @GetMapping("/test/verify-encoder")
    public ResponseEntity<Map<String, Object>> verifyEncoder() {
        String plainPassword = "TestPassword123";
        String hashedPassword = passwordEncoder.encode(plainPassword);
        boolean matches = passwordEncoder.matches(plainPassword, hashedPassword);

        Map<String, Object> result = new HashMap<>();
        result.put("plainPassword", plainPassword);
        result.put("hashedPassword", hashedPassword);
        result.put("matches", matches);
        result.put("encoderClass", passwordEncoder.getClass().getName());

        return ResponseEntity.ok(result);
    }

    /**
     * Endpoint for registering a new user.
     * This now calls the UserService which hashes the password.
     * POST /api/v1/auth/register
     */
    @PostMapping("/register")
    public ResponseEntity<UserResponse> registerUser(@Valid @RequestBody RegistrationRequest request) {

        // 1. Call the service to create the user (and hash password)
        User savedUser = userService.registerNewUser(request);

        // 2. Convert to DTO using the static method
        UserResponse response = UserResponse.fromUser(savedUser);

        // 3. Return a 201 Created status
        return new ResponseEntity<>(response, HttpStatus.CREATED);
    }

    /**
     * Endpoint for logging in a user.
     * This validates credentials and returns a JWT.
     * POST /api/v1/auth/login
     */
    @PostMapping("/login")
    public ResponseEntity<AuthResponse> login(@Valid @RequestBody LoginRequest loginRequest) {
        try {
            // 1. Authenticate the user
            Authentication authentication = authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(loginRequest.getEmail(), loginRequest.getPassword()));

            // 2. If authentication is successful, load UserDetails
            final UserDetails userDetails = userDetailsService.loadUserByUsername(loginRequest.getEmail());

            // 3. Generate the JWT token
            final String token = jwtUtil.generateToken(userDetails.getUsername());

            // 4. Get the full User object to build the response
            User user = userRepository.findByEmail(loginRequest.getEmail())
                    .orElseThrow(() -> new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR,
                            "User not found after authentication"));

            // 5. Get the user's query counts (logic copied from QuotaInterceptor)
            int maxQueries = user.getSubscription().getQueriesNu();
            int remainingQueries;

            if (maxQueries <= 0) {
                remainingQueries = -1; // -1 represents "unlimited"
            } else {
                Optional<ActivityLog> todayLog = activityLogRepository.findByUserAndDate(user, LocalDate.now());

                int usedQueries = todayLog.map(ActivityLog::getQueriesNo).orElse(0);
                remainingQueries = maxQueries - usedQueries;
            }

            // 6. Create the UserResponse DTO with query counts
            UserResponse userResponse = UserResponse.fromUser(user, remainingQueries, maxQueries);

            // 7. Return the AuthResponse (Token + UserResponse)
            return ResponseEntity.ok(new AuthResponse(token, userResponse));

        } catch (Exception e) {
            // DEBUGGING: Check why it failed
            Optional<User> debugUser = userRepository.findByEmail(loginRequest.getEmail());
            if (debugUser.isPresent()) {
                String storedHash = debugUser.get().getPassword();
                boolean matches = passwordEncoder.matches(loginRequest.getPassword(), storedHash);
                if (!matches) {
                    throw new ResponseStatusException(HttpStatus.UNAUTHORIZED,
                            "Password mismatch! Input: " + loginRequest.getPassword() + ", Stored Hash: " + storedHash,
                            e);
                } else {
                    throw new ResponseStatusException(HttpStatus.UNAUTHORIZED,
                            "Password MATCHES but AuthManager failed! " + e.getMessage(), e);
                }
            } else {
                throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "User not found in DB", e);
            }
        }
    }
}