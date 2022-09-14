package com.example.nd_medicine.controller;

import com.example.nd_medicine.DatabaseInitializer;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

//    DatabaseInitializer databaseInitializer;
//    com.example.nd_medicine.repository.userRep userRep;
//    DatabaseInitializer db = new DatabaseInitializer(userRep);
    @GetMapping("")
    public String viewHomePage(){

        return "index";
    }

    @GetMapping("/admin/login")
    public String viewAdminLoginPage(){
        return "admin/admin_login";
    }

    @GetMapping("/doctor/login")
    public String viewDoctorLoginPage(){
        return "doctor/doctor_login";
    }
    @GetMapping("/patient/login")
    public String viewPatientLoginPage(){
        return "patient/patient_login";
    }

    @GetMapping("/admin/home")
    public String viewAdminHomePage(){
        return "admin/admin_home";
    }



}
