package com.example.nd_medicine.repository;


import com.example.nd_medicine.entity.Appointment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AppointmentRepository extends JpaRepository<Appointment, Long> {

    //need to fix all this
    List<Appointment> findAppointmentsByDoctorId(Long doctorId);
    List<Appointment> findAppointmentsByPatientId(Long patientId);
    Appointment findAppointmentByAppointmentId(Long appointmentId);



}
