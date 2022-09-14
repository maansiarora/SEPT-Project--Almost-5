package com.example.nd_medicine;

import com.example.nd_medicine.entity.Role;
import com.example.nd_medicine.entity.User;
import com.example.nd_medicine.repository.userRep;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;

import java.util.List;

public class DatabaseInitializer {
    private userRep rep;

    public DatabaseInitializer(userRep rep) {
        this.rep = rep;

    }
    @Bean
    public CommandLineRunner initializeDatabase() {
        return args -> {
            User user1 = new User("sai@gmail.com", "sai123", Role.ADMIN);
            User user2 = new User("darian@gmail.com", "darian123", Role.ADMIN);
            User user3 = new User("jahnvi@gmail.net", "jahnvi123", Role.PATIENT);
            User user4 = new User("maansi@gmail.com", "maansi123", Role.DOCTOR);
            User user5 = new User("suhavni@gmail.com", "suhavni123", Role.DOCTOR);

            rep.saveAll(List.of(user1, user2, user3, user4,user5));

            System.out.println("Database initialized!!!!");
            System.out.println("yes");
        };
    }



}
