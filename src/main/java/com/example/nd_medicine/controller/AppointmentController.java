package com.example.nd_medicine.controller;

import com.example.nd_medicine.entity.Appointment;
import com.example.nd_medicine.service.AppointmentService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/appointment")
public class AppointmentController {

    private final AppointmentService appointmentService;

    public AppointmentController(AppointmentService appointmentService) {
        this.appointmentService = appointmentService;
    }

    //new appointment request
    @PostMapping("/createAppointment")
    public Appointment createAppointment(@RequestBody Appointment newAppointment) {
        return appointmentService.create(newAppointment);

    }

    //getting a particular appointment by id useful in admin maybe
    @GetMapping(value = "/{appointmentId}")
    public Appointment viewAppointmentById(@PathVariable Long appointmentId){
        return appointmentService.findAppointmentByAppointmentId(appointmentId);
    }

    //all appointments for a particular patient -- useful in patient profile
    @GetMapping(value = "/patient/{patientId}")
    public List<Appointment> viewAppointmentOfPatient(@PathVariable Long patientId){
        return appointmentService.findByPatientId(patientId);
    }

    //all appointments for a particular patient -- useful in doc profile
    @GetMapping(value = "/doctor/{doctorId}")
    public List<Appointment> viewAppointmentOfDoctor(@PathVariable Long doctorId){
        return appointmentService.findByDoctorId(doctorId);
    }


}
