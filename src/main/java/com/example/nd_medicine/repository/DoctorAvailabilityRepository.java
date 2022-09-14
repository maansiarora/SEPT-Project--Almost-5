package com.example.nd_medicine.repository;

import com.example.nd_medicine.entity.Doctor;
import com.example.nd_medicine.entity.DoctorAvailability;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DoctorAvailabilityRepository extends JpaRepository<DoctorAvailability, Integer> {

}
