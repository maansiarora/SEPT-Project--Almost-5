package com.example.nd_medicine.controller;

import com.example.nd_medicine.model.Medicine;
import com.example.nd_medicine.service.MedicineService;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
public class MedicineController {
    private final MedicineService medicineService;

    public MedicineController(MedicineService prescriptionService) {
        this.medicineService = prescriptionService;
    }

    @GetMapping(value = "/medicine/{id}")
    public Medicine viewMedicine(@PathVariable Long id){
        return medicineService.findById(id);
    }

    @GetMapping(value = "/medicine/patient/{patientId}")
    public List<Medicine> viewPrescriptionOfPatient(@PathVariable Long patientId){
        return medicineService.findByPatientId(patientId);
    }

    @GetMapping(value = "/medicine/doctor/{doctorId}")
    public List<Medicine> viewDoctorPrescribedPrescription(@PathVariable Long doctorId){
        return medicineService.findByDoctorId(doctorId);
    }

    @PostMapping("/createMedicine")
    public Medicine createPrescription(@RequestBody Medicine newMedicine) {
        return medicineService.create(newMedicine);
    }

}
