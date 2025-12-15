package com.example.soulsync.util;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class PasswordHashGenerator {
    public static void main(String[] args) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(10);
        String password = "password123";
        String hash = encoder.encode(password);

        System.out.println("=".repeat(60));
        System.out.println("BCrypt Hash Generator");
        System.out.println("=".repeat(60));
        System.out.println("Password: " + password);
        System.out.println("Hash: " + hash);
        System.out.println("Hash Length: " + hash.length());
        System.out.println("=".repeat(60));

        // Verify it works
        boolean matches = encoder.matches(password, hash);
        System.out.println("Verification: " + (matches ? "✓ VALID" : "✗ INVALID"));
        System.out.println("=".repeat(60));
    }
}
