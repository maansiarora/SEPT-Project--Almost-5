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
    public void given_when_thenReturnString() throws Exception {

        String postRequest = "{\"first_name\" : \"First Name\", \"last_name\" : \"Last Name\", \"email\" : \"email\", \"password\" : \"password\"}";

        Patient testPatient = new Patient(2, "firstname", "lastname", "email", "0000000000");
        Response response = new Response("Success","Patient Created");
        given(service.signupPatient(any())).willReturn(response);

        mvc.perform(post("/user/signup/patient").contentType(MediaType.APPLICATION_JSON).content(JsonUtil.toJson(testPatient))).andExpect(MockMvcResultMatchers.jsonPath("$.status", CoreMatchers.is("Success")));
        verify(service, VerificationModeFactory.times(1)).signupPatient(any());
        reset(service);

//        SignUpResponse testResponse = new SignUpResponse();
//        testResponse.setFirstName("First Name");
//        testResponse.setLastName("Last Name:");
//        testResponse.setEmail("email");
//        testResponse.setPassword("password");
//
//        service.signupPatients(testResponse);
//
//        // Need a method in each class to return post request
//
//        MvcResult result = mvc.perform(post("/user/signup/patient")
//                        .accept(MediaType.APPLICATION_JSON)
//                        .contentType(MediaType.APPLICATION_JSON)
//                        .content(postRequest))
//                .andDo(MockMvcResultHandlers.print())
//                .andReturn();
//
//        String content = result.getResponse().getContentAsString();
//        System.out.println("Body Content:\n" + content);


    }

}

// Test Attempt 2

//    MockHttpServletRequestBuilder requestBuilder = post("/user/signup/patient")
//            .accept(APPLICATION_JSON)
//            .contentType(APPLICATION_JSON)
//            .content(postRequest);
//
//        mvc
//                .perform(requestBuilder)
//                .andDo(MockMvcResultHandlers.print());