package com.example.nd_medicine.repository;

import com.example.nd_medicine.entity.Availability;
import com.example.nd_medicine.entity.Doctor;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface AvailabilityRepository extends JpaRepository<Availability, Long> {
    List<Availability> findAvailabilitiesByDoctorId(Long id);

    List<Availability> findByDoctorId(Doctor doctor);


}
