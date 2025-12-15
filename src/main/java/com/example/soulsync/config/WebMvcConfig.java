package com.example.soulsync.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    @Autowired
    private QuotaInterceptor quotaInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // Apply quota interceptor to search and match endpoints
        registry.addInterceptor(quotaInterceptor)
                .addPathPatterns("/api/v1/search")
                .addPathPatterns("/api/v1/matches/**");
    }

    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/api/**")
                // TODO: Replace with your actual frontend URL in production
                // For development, use specific localhost origin
                .allowedOrigins("http://localhost:5173", "http://localhost:3000", "http://127.0.0.1:5173")
                .allowedMethods("GET", "POST", "PUT", "DELETE", "OPTIONS")
                .allowedHeaders("*")
                .allowCredentials(true) // Changed to true for better cookie/header support
                .maxAge(3600); // Cache preflight for 1 hour
    }
}