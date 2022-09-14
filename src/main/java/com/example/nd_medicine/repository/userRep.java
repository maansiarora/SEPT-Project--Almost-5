package com.example.nd_medicine.repository;

import com.example.nd_medicine.entity.User;
import org.springframework.data.repository.CrudRepository;

public interface userRep extends CrudRepository<User, Integer> {

     public User findByEmail(String email);


}