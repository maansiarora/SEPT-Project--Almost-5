package com.example.nd_medicine.service;
import com.example.nd_medicine.entity.Doctor;
import com.example.nd_medicine.repository.DoctorRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DoctorService {
    private final DoctorRepository doctorRepository;

    public DoctorService(DoctorRepository doctorRepository) {
        this.doctorRepository = doctorRepository;
    }

    public Doctor findById(Long id){
        return doctorRepository.findDoctorById(id);
    }

    public Doctor saveDoctor(Doctor doctor){
        return doctorRepository.save(doctor);
    }

    public List<Doctor> findAllDoctors(String email){
        return doctorRepository.findDoctorByEmail(email);
    }

    //public List<User> findAll() {return userRepository.findAll();}

}