package com.example.nd_medicine.controller;

import com.example.nd_medicine.entity.Doctor;
import com.example.nd_medicine.entity.DoctorAvailability;
import com.example.nd_medicine.repository.DoctorAvailabilityRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;

@RestController
@RequestMapping("/doctor")
public class AvailabilityController {

    @Autowired
    DoctorAvailabilityRepository d_Availability_Repository;

    @PostMapping(value = "availabilities")
    public DoctorAvailability addAvailabilities()
    {

        Doctor doctor = new Doctor();
        doctor.setId(0);
        DoctorAvailability doctorAvailability = new DoctorAvailability();

        doctorAvailability.setId(0);
        doctorAvailability.setDoctorID(doctor.getId());

        Date startTime = new Date();
        startTime.setTime(1400);
        Date endTime = new Date();
        endTime.setTime(1200);

        doctorAvailability.setBooked(true);

        doctorAvailability.setStartTime(startTime);
        doctorAvailability.setEndTime(endTime);

        d_Availability_Repository.save(doctorAvailability);

        return doctorAvailability;

    }



}
