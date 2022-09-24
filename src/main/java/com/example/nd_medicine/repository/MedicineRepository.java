package com.example.nd_medicine.repository;

import com.example.nd_medicine.model.Medicine;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MedicineRepository extends JpaRepository<Medicine, Long>{

    Medicine findMedicineById(Long id);

    List<Medicine> findMedicineByPatientId(Long patientId);

    List<Medicine> findMedicineByDoctorId(Long doctorId);

    List<Medicine> findByMedicineName(String medicineName);

}
