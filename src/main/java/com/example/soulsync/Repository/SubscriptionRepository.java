package com.example.soulsync.Repository;

import com.example.soulsync.model.Subscription;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface SubscriptionRepository extends JpaRepository<Subscription, Long> {
    // You can add custom queries here if needed
    @Query("SELECT s FROM Subscription s WHERE s.sName = :sName")
    Optional<Subscription> findBySName(@Param("sName") String sName);

    @Query("SELECT s FROM Subscription s WHERE s.sid = :id")
    Optional<Subscription> findById(@Param("id") Long id);

    @Query("SELECT s FROM Subscription s")
    List<Subscription> findAll();
}