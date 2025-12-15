package com.example.soulsync.config;

import com.example.soulsync.security.JwtAuthFilter;
import com.example.soulsync.security.UserDetailsServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import static org.springframework.security.config.Customizer.withDefaults;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Autowired
    private JwtAuthFilter jwtAuthFilter;

    @Autowired
    private UserDetailsServiceImpl userDetailsService;

    /**
     * This is the main security configuration chain.
     */
    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
                // 1. Enable CORS (using the rules from WebConfig.java)
                .cors(withDefaults())

                // 2. Disable CSRF (not needed for stateless REST APIs)
                .csrf(csrf -> csrf.disable())

                // 3. Define authorization rules
                .authorizeHttpRequests(auth -> auth
                        // Allow all "auth" endpoints (login, register)
                        .requestMatchers("/api/v1/auth/**").permitAll()

                        // Allow frontend to get subscription list
                        .requestMatchers(HttpMethod.GET, "/api/v1/subscriptions").permitAll()

                        // All other requests must be authenticated
                        .anyRequest().authenticated()
                )

                // 4. Set session management to STATELESS
                // This tells Spring Security not to create sessions
                .sessionManagement(session -> session.sessionCreationPolicy(SessionCreationPolicy.STATELESS))

                // 5. Set our custom authentication provider
                .authenticationProvider(authenticationProvider())

                // 6. Add our custom JWT filter *before* the standard auth filter
                .addFilterBefore(jwtAuthFilter, UsernamePasswordAuthenticationFilter.class);

        return http.build();
    }

    /**
     * Defines the password encoder (BCrypt).
     */
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    /**
     * Binds our custom UserDetailsService and PasswordEncoder
     * to Spring Security's authentication provider.
     */
    @Bean
    public AuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
        authProvider.setUserDetailsService(userDetailsService);
        authProvider.setPasswordEncoder(passwordEncoder());
        return authProvider;
    }

    /**
     * --- THIS IS THE FIX ---
     * Exposes the AuthenticationManager as a Bean, so it can be
     * autowired into our AuthController.
     */
    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration config) throws Exception {
        return config.getAuthenticationManager();
    }
}