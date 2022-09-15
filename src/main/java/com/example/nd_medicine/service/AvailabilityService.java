package com.example.nd_medicine.service;

import com.example.nd_medicine.entity.Availability;
import com.example.nd_medicine.repository.AvailabilityRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AvailabilityService {
    private final AvailabilityRepository availabilityRepository;

    public AvailabilityService(AvailabilityRepository availabilityRepository) {
        this.availabilityRepository = availabilityRepository;
    }

    public Availability saveDoctorAvailability(Availability availability){
        return availabilityRepository.save(availability);
    }

    public List<Availability> findAvailabilityByDoctorId(Long id){
        return availabilityRepository.findAvailabilitiesByDoctorId(id);
    }
}