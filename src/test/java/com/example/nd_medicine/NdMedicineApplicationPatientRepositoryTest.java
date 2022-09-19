package com.example.nd_medicine;

import com.example.nd_medicine.controller.UserController;
import com.example.nd_medicine.entity.AuthenticationLogin;
import com.example.nd_medicine.entity.Doctor;
import com.example.nd_medicine.entity.Patient;
import com.example.nd_medicine.entity.User;
import com.example.nd_medicine.exception.CustomException;
import com.example.nd_medicine.repository.DoctorRepository;
import com.example.nd_medicine.repository.PatientRepository;
import com.example.nd_medicine.security.LoginResponse;
import com.example.nd_medicine.security.Response;
import com.example.nd_medicine.security.SignUpResponse;
import com.example.nd_medicine.service.AuthenticationService;
import com.example.nd_medicine.service.UserService;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.jayway.jsonpath.spi.json.GsonJsonProvider;
import org.hamcrest.CoreMatchers;
import org.junit.After;
import org.junit.Assert;
import org.junit.jupiter.api.Test;
import org.junit.Before;
import org.junit.runner.RunWith;
import org.mockito.Mockito;
import org.mockito.internal.verification.VerificationModeFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.data.rest.RepositoryRestMvcAutoConfiguration;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureWebMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.stereotype.Repository;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;

import static org.hamcrest.CoreMatchers.is;
import static org.mockito.BDDMockito.given;
import static org.mockito.Mockito.*;
import static org.springframework.http.MediaType.APPLICATION_JSON;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;
import static org.springframework.test.web.servlet.setup.MockMvcBuilders.webAppContextSetup;

import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultHandlers;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.web.context.WebApplicationContext;

import javax.print.Doc;
import java.util.Objects;

@RunWith(SpringRunner.class)
@WebMvcTest(value = UserController.class)
class NdMedicineApplicationTests {


    @Autowired
    private MockMvc mvc;

    @MockBean
    private PatientRepository p_repository;

    @MockBean
    private DoctorRepository d_repository;

    @MockBean
    private UserService userservice;

    @MockBean
    private AuthenticationService authenticationservice;

    @Before
    public void setUp() throws Exception {

    }

    @After
    public void resetDb() {
        p_repository.deleteAll();
        d_repository.deleteAll();
    }

    @Test
    public void givenNewPatient_whenSigningUp_thenAddNewPatientSuccess() throws Exception {

        Patient testPatient = new Patient(0, "Debbie", "Lou", "debbielou@gmail.com", "0481555666");
        Response response = new Response("Success","Patient Created");
        given(userservice.signupPatient(any())).willReturn(response);

        mvc.perform(post("/user/signup/patient")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(JsonUtil.toJson(testPatient)))
                .andDo(MockMvcResultHandlers.print())
                .andExpect(MockMvcResultMatchers
                        .jsonPath("$.status", CoreMatchers.is("Success")));
        verify(userservice, VerificationModeFactory.times(1)).signupPatient(any());
        reset(userservice);

    }

    @Test
    public void givenDuplicatePatient_whenSigningUp_thenAddNewPatientFail() throws Exception {

        Patient testPatient = new Patient(0, "Debbie", "Lou", "debbielou@gmail.com", "0481555666");
        Patient testPatientDuplicateId = new Patient(0, "Definitely-Not-Debbie", "Lou", "definitelynotdebbie@gmail.com", "0481666555");

        Response response = new Response("Failed","Patient Already Exists");

        p_repository.saveAndFlush(testPatient);

        given(userservice.signupPatient(any())).willReturn(response);

        mvc.perform(post("/user/signup/patient")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(JsonUtil.toJson(testPatientDuplicateId)))
                .andDo(MockMvcResultHandlers.print())
                .andExpect(MockMvcResultMatchers
                        .jsonPath("$.status", CoreMatchers.is("Failed")));
        verify(userservice, VerificationModeFactory.times(1)).signupPatient(any());
        reset(userservice);

    }

    @Test
    public void givenNewDoctor_whenSigningUp_thenAddNewDoctorSuccess() throws Exception {

        Doctor testDoctor = new Doctor("Liza", "Liza's Last Name", "lizasemailaddress@gmail.com");
        Response response = new Response("Success","Doctor Created");
        given(userservice.signupDoctor(any())).willReturn(response);

        mvc.perform(post("/user/signup/doctor")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(JsonUtil.toJson(testDoctor)))
                .andDo(MockMvcResultHandlers.print())
                .andExpect(MockMvcResultMatchers
                        .jsonPath("$.status", CoreMatchers.is("Success")));
        verify(userservice, VerificationModeFactory.times(1)).signupDoctor(any());
        reset(userservice);

    }

    @Test
    public void givenDuplicateDoctorEmail_whenSigningUp_thenAddNewDoctorFail() throws Exception {

        Doctor testDoctor = new Doctor("Liza", "Liza's Last Name", "lizasemailaddress@gmail.com");
        Doctor testDoctorDuplicate = new Doctor("LizaV2ElectricBoogaloo", "Liza's Last Name", "lizasemailaddress@gmail.com");

        Response response = new Response("Failed","Doctor Already Exists");

        d_repository.saveAndFlush(testDoctor);

        given(userservice.signupDoctor(any())).willReturn(response);

        mvc.perform(post("/user/signup/doctor")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(JsonUtil.toJson(testDoctorDuplicate)))
                .andDo(MockMvcResultHandlers.print())
                .andExpect(MockMvcResultMatchers
                        .jsonPath("$.status", CoreMatchers.is("Failed")));
        verify(userservice, VerificationModeFactory.times(1)).signupDoctor(any());
        reset(userservice);

    }

    @Test
    public void givenCorrectPatientPassword_whenLoggingIn_thenA() throws Exception {



    }

}