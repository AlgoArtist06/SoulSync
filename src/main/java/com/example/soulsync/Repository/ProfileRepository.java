package com.example.soulsync.Repository;

import com.example.soulsync.model.Profile;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

@Repository
public interface ProfileRepository extends JpaRepository<Profile, Long>, JpaSpecificationExecutor<Profile> {
    // You can add finders here, e.g.:
    // Optional<Profile> findByUser(User user);
}