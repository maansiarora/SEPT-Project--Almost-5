package com.example.nd_medicine;

import com.example.nd_medicine.controller.UserController;
import com.example.nd_medicine.entity.Patient;
import com.example.nd_medicine.entity.User;
import com.example.nd_medicine.security.Response;
import com.example.nd_medicine.security.SignUpResponse;
import com.example.nd_medicine.service.UserService;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.jayway.jsonpath.spi.json.GsonJsonProvider;
import org.hamcrest.CoreMatchers;
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

@RunWith(SpringRunner.class)
@WebMvcTest(value = UserController.class)
class NdMedicineApplicationTests {


    @Autowired
    private MockMvc mvc;

    @MockBean
    private UserService service;

    @Autowired
    private WebApplicationContext webApplicationContext;

    @Before
    public void setUp() throws Exception {

    }

    @Test
    public void givenNewPatient_whenSigningUp_thenAddNewPatientSuccess() throws Exception {

        Patient testPatient = new Patient(0, "Debbie", "Lou", "debbielou@gmail.com", "0481555666");
        Response response = new Response("Success","Patient Created");
        given(service.signupPatient(any())).willReturn(response);

        mvc.perform(post("/user/signup/patient")
                .contentType(MediaType.APPLICATION_JSON)
                .content(JsonUtil.toJson(testPatient)))
                .andDo(MockMvcResultHandlers.print())
                .andExpect(MockMvcResultMatchers
                        .jsonPath("$.status", CoreMatchers.is("Success")));
        verify(service, VerificationModeFactory.times(1)).signupPatient(any());
        reset(service);

    }

    @Test
    public void givenDuplicatePatient_whenSigningUp_thenAddNewPatientFail() throws Exception {

        Patient testPatient = new Patient(0, "Debbie", "Lou", "debbielou@gmail.com", "0481555666");
        Patient testPatientDuplicateId = new Patient(0, "Definitely-Not-Debbie", "Lou", "definitelynotdebbie@gmail.com", "0481666555");

        Response response = new Response("Failed","Patient Already Exists");

        given(service.signupPatient(any())).willReturn(response);

        mvc.perform(post("/user/signup/patient")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(JsonUtil.toJson(testPatient)));

        mvc.perform(post("/user/signup/patient")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(JsonUtil.toJson(testPatientDuplicateId)))
                .andDo(MockMvcResultHandlers.print())
                .andExpect(MockMvcResultMatchers
                        .jsonPath("$.status", CoreMatchers.is("Failed")));


        verify(service, VerificationModeFactory.times(1)).signupPatient(any());
        reset(service);

    }

}