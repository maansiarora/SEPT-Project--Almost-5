package com.example.nd_medicine.repository;

import com.example.nd_medicine.entity.Doctor;
import org.springframework.stereotype.Repository;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

@Repository
public interface DoctorRepository extends JpaRepository <Doctor, Integer> {

    List<Doctor> findByCid(Integer ClinicId);
}