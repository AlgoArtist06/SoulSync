package com.example.soulsync.Repository;

import com.example.soulsync.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    // Spring Data JPA will automatically create methods for you like:
    // - findByEmail(String email)
    // - findByCaste(String caste)
    // - findByAgeGreaterThan(int age)
    // --- ADD THIS METHOD ---
    @Query("SELECT u FROM User u JOIN FETCH u.subscription WHERE u.userId = :id")
    Optional<User> findByIdWithSubscription(@Param("id") Long id);

    @Query("SELECT u FROM User u WHERE u.email = :email")
    Optional<User> findByEmail(@Param("email") String email);

    @Query("SELECT u FROM User u WHERE u.userId = :id")
    Optional<User> findById(@Param("id") Long id);

    @Query("SELECT u FROM User u")
    List<User> findAll();

}