package com.example.nd_medicine.controller;

import com.example.nd_medicine.entity.Doctor;
import com.example.nd_medicine.entity.Patient;
import com.example.nd_medicine.repository.DoctorRepository;
import com.example.nd_medicine.repository.PatientRepository;
import com.example.nd_medicine.service.DoctorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;
import java.util.function.Function;

@RestController
@RequestMapping("/signup")
public class RegistrationController
{
    @Autowired
    DoctorRepository d_Repository;
    @Autowired
    PatientRepository p_Repository;

    @PostMapping(value = "doctor")
    public Doctor createDoctor(@RequestBody Doctor newDoctor){
        return d_Repository.save(newDoctor);
    }

    @PostMapping(value = "patient")
    public Patient createDoctor(@RequestBody Patient newPatient){
        return p_Repository.save(newPatient);
    }

}
