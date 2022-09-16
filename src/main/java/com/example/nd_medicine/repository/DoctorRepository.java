package com.example.nd_medicine.repository;

import com.example.nd_medicine.entity.Doctor;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DoctorRepository extends JpaRepository <Doctor, Long> {

    Doctor findDoctorById(Long id);
    List<Doctor> findDoctorByEmail(String email);
}