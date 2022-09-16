package com.example.nd_medicine.service;

import com.example.nd_medicine.entity.AuthenticationLogin;
import com.example.nd_medicine.entity.Doctor;
import com.example.nd_medicine.entity.Patient;
import com.example.nd_medicine.entity.User;
import com.example.nd_medicine.exception.AuthenticationFailException;
import com.example.nd_medicine.exception.CustomException;
import com.example.nd_medicine.repository.DoctorRepository;
import com.example.nd_medicine.repository.PatientRepository;
import com.example.nd_medicine.repository.UserRepository;
import com.example.nd_medicine.security.Login;
import com.example.nd_medicine.security.LoginResponse;
import com.example.nd_medicine.security.Response;
import com.example.nd_medicine.security.SignUpResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.xml.bind.DatatypeConverter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Objects;

@Service
public class UserService {

    @Autowired
    UserRepository userRepository;

    @Autowired
    AuthenticationService authenticationService;

    @Autowired
    DoctorRepository d_Repository;
    @Autowired
    PatientRepository p_Repository;



    @Transactional
    public Response signup(SignUpResponse signUpResponse){


        if(Objects.nonNull(userRepository.findByEmail(signUpResponse.getEmail()))){
            throw new CustomException("ALready Exsit");

        }

        String encryptedpassword = signUpResponse.getPassword();

        System.out.println(encryptedpassword);



        // fixed
        try {
            encryptedpassword = hashPassword(signUpResponse.getPassword());
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }

        User user = new User(signUpResponse.getFirstName(), signUpResponse.getLastName(), signUpResponse.getEmail(), encryptedpassword);


        userRepository.save(user);

        final AuthenticationLogin authenticationLogin= new AuthenticationLogin(user);

        authenticationService.saveAuthentication(authenticationLogin);


        Response response = new Response("Success","user Created");

        return response;


    }

    private String hashPassword(String password) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(password.getBytes());
        byte[] digest = md.digest();
        String hash = DatatypeConverter
                .printHexBinary(digest).toUpperCase();
        return hash;
    }

    public LoginResponse logIn(Login login) {

        User user = userRepository.findByEmail(login.getEmail());

        if(Objects.isNull(user)){
            throw new AuthenticationFailException("User is not in the system");
        }
        try{
            if (!user.getPassword().equals(hashPassword(login.getPassword()))) {
                throw new AuthenticationFailException("Incorrect Password");
            }

        }
        catch (NoSuchAlgorithmException e){
            e.printStackTrace();
        }

        AuthenticationLogin authenticationLogin = authenticationService.getToken(user);

        if(Objects.isNull(authenticationLogin)){
            throw new CustomException("Not present");
        }

        return new LoginResponse("Sucess", authenticationLogin.getToken());

    }

    public Response signupDoctor(SignUpResponse signUpResponse) {

        if(Objects.nonNull(userRepository.findByEmail(signUpResponse.getEmail()))){
            throw new CustomException("ALready Exsit");

        }

        String encryptedpassword = signUpResponse.getPassword();

        System.out.println(encryptedpassword);



        // fixed
        try {
            encryptedpassword = hashPassword(signUpResponse.getPassword());
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }

        User user = new User(signUpResponse.getFirstName(), signUpResponse.getLastName(), signUpResponse.getEmail(), encryptedpassword);


        userRepository.save(user);

        final AuthenticationLogin authenticationLogin= new AuthenticationLogin(user);

        authenticationService.saveAuthentication(authenticationLogin);


        //doctor
        Doctor doctor = new Doctor(user.getFirstName(), user.getLastName(), user.getEmail());

        d_Repository.save(doctor);


        Response response = new Response("Success","Doctor Created");




        return response;

    }

    public Response signupPatient(SignUpResponse signUpResponse) {
        if(Objects.nonNull(userRepository.findByEmail(signUpResponse.getEmail()))){
            throw new CustomException("ALready Exsit");

        }

        String encryptedpassword = signUpResponse.getPassword();

        System.out.println(encryptedpassword);



        // fixed
        try {
            encryptedpassword = hashPassword(signUpResponse.getPassword());
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }

        User user = new User(signUpResponse.getFirstName(), signUpResponse.getLastName(), signUpResponse.getEmail(), encryptedpassword);


        userRepository.save(user);

        final AuthenticationLogin authenticationLogin= new AuthenticationLogin(user);

        authenticationService.saveAuthentication(authenticationLogin);


        //patient
        Patient patient = new Patient(user.getFirstName(), user.getLastName(), user.getEmail());

        p_Repository.save(patient);


        Response response = new Response("Success","Patient Created");




        return response;
    }
}
