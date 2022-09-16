package com.example.nd_medicine.repository;

import com.example.nd_medicine.entity.Appointment;
import com.example.nd_medicine.entity.Doctor;
import com.example.nd_medicine.entity.Slot;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SlotRepository extends JpaRepository<Slot,Long> {

    Slot findByDoctor(Doctor doctor);

    List<Slot> findSlotsByDoctorId(Long doctorId);
}

