package com.example.nd_medicine.controller;

import com.example.nd_medicine.entity.Doctor;
import com.example.nd_medicine.entity.Patient;
import com.example.nd_medicine.repository.DoctorRepository;
import com.example.nd_medicine.repository.PatientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

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
    public Doctor addDoctor()
    {

        Doctor newDoctor = new Doctor();
        newDoctor.setFirstname("Ben");
        newDoctor.setId(0);
        newDoctor.setLastname("Also Ben");
        newDoctor.setPhone("0400000000");
        d_Repository.save(newDoctor);

        return newDoctor;

    }

        @PostMapping(value = "patient")
        public Patient addPatient()
        {

            Patient newPatient = new Patient();
            newPatient.setFirstname("Lucky");
            newPatient.setId(9);
            newPatient.setLastname("Kiya");
            newPatient.setPhone("0400000000");
            p_Repository.save(newPatient);

            return newPatient;
        }

}
