package com.example.nd_medicine;

import com.example.nd_medicine.controller.UserController;
import com.example.nd_medicine.entity.User;
import com.example.nd_medicine.security.SignUpResponse;
import com.example.nd_medicine.service.UserService;
import com.jayway.jsonpath.spi.json.GsonJsonProvider;
import org.junit.Assert;
import org.junit.jupiter.api.Test;
import org.junit.Before;
import org.junit.runner.RunWith;
import org.mockito.Mockito;
import org.mockito.internal.verification.VerificationModeFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;

import static org.hamcrest.CoreMatchers.is;
import static org.mockito.BDDMockito.given;
import static org.mockito.Mockito.reset;
import static org.mockito.Mockito.verify;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;

@RunWith(SpringRunner.class)
@WebMvcTest(value = UserController.class)
class NdMedicineApplicationTests {

    @Autowired
    private MockMvc mvc;

    @MockBean
    private UserService service;

    @Before
    public void setUp() throws Exception {
    }

    @Test
    public void given_when_thenReturnString() throws Exception {

        String postRequest = "{\"first_name\" : \"First Name\", \"last_name\" : \"Last Name\", \"email\" : \"email\", \"password\" : \"password\"}";

        SignUpResponse testResponse = new SignUpResponse();
        testResponse.setFirstName("First Name");
        testResponse.setLastName("Last Name:");
        testResponse.setEmail("email");
        testResponse.setPassword("password");

        service.signupPatient(testResponse);

        mvc.perform(post("/user/signup")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(postRequest))
                .andExpect(status().isOk())
                .andExpect(content()
                        .contentTypeCompatibleWith(MediaType.APPLICATION_JSON))
                .andExpect(jsonPath("$[0].status", is("Success")));

    }

}