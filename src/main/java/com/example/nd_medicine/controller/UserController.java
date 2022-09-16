package com.example.nd_medicine.controller;

import com.example.nd_medicine.security.Login;
import com.example.nd_medicine.security.LoginResponse;
import com.example.nd_medicine.security.Response;
import com.example.nd_medicine.security.SignUpResponse;
import com.example.nd_medicine.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RequestMapping("user")
@RestController
public class UserController {

    @Autowired
    UserService userService;

    @PostMapping("/signup")
    public Response signup(@RequestBody SignUpResponse signUpResponse){
        return userService.signup(signUpResponse);
    }
    @PostMapping("/login")
    public LoginResponse login(@RequestBody Login login){
        return userService.logIn(login);

    }
}
