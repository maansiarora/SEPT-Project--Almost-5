package com.example.nd_medicine.controller;

import com.example.nd_medicine.entity.Doctor;
import com.example.nd_medicine.entity.Patient;
import com.example.nd_medicine.repository.DoctorRepository;
import com.example.nd_medicine.repository.PatientRepository;
import com.example.nd_medicine.service.DoctorService;
import com.sun.source.doctree.DocCommentTree;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.query.FluentQuery;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Optional;
import java.util.function.Function;

@RestController
@RequestMapping("/signup")
public class RegistrationController {

    @Autowired
    DoctorRepository d_Repository;

    @PostMapping(value = "doctor")
    public Doctor addDoctor() {

        Doctor newDoctor = new Doctor();
        newDoctor.setFirstname("Ben");
        newDoctor.setId(0);
        newDoctor.setLastname("Also Ben");
        newDoctor.setPhone(0400000000);

        d_Repository.save(newDoctor);

        return newDoctor;

    }

}
