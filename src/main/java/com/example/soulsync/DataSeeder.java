package com.example.soulsync;

import com.example.soulsync.model.Subscription;
import com.example.soulsync.Repository.SubscriptionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

@Component
public class DataSeeder implements CommandLineRunner {

    @Autowired
    private SubscriptionRepository subscriptionRepository;

    public void run(String... args) throws Exception {
        // Seed all subscription plans
        seedSubscription("FREE", 0.0, 5, 3);
        seedSubscription("BASIC", 999.0, 20, 10);
        seedSubscription("GOLD", 2999.0, 100, 50);
        seedSubscription("PLATINUM", 4999.0, -1, -1); // -1 = unlimited
    }

    private void seedSubscription(String name, Double fees, Integer queries, Integer profiles) {
        Subscription sub = subscriptionRepository.findBySName(name).orElse(new Subscription());

        // Update or set fields
        sub.setsName(name);
        sub.setFees(fees);
        sub.setQueriesNu(queries);
        sub.setProfileAllowed(profiles);

        subscriptionRepository.save(sub);
        System.out.println("Subscription '" + name + "' seeded/updated.");
    }
}