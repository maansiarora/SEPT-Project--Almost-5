package com.example.nd_medicine.service;

import com.example.nd_medicine.model.Medicine;
import com.example.nd_medicine.repository.MedicineRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MedicineService {

    private final MedicineRepository medicineRepository;

    public MedicineService(MedicineRepository medicineRepository) {
        this.medicineRepository = medicineRepository;
    }

    public Medicine findById(Long id) {
        return medicineRepository.findMedicineById(id);
    }

    public List<Medicine> findByPatientId(Long patientId) {
        return medicineRepository.findMedicineByPatientId(patientId);
    }

    public List<Medicine> findByDoctorId(Long doctorId) {
        return medicineRepository.findMedicineByDoctorId(doctorId);
    }

    public List<Medicine> findByMedicineName(String medicineName) {
        return medicineRepository.findByMedicineName(medicineName);
    }

    public Medicine create(Medicine newMedicine){
        return medicineRepository.save(newMedicine);
    }


}
