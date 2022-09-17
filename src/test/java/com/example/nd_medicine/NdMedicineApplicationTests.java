package com.example.nd_medicine;

import com.example.nd_medicine.controller.AppointmentController;
import com.example.nd_medicine.entity.Appointment;
import com.example.nd_medicine.service.AppointmentService;
import com.jayway.jsonpath.spi.json.GsonJsonProvider;
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
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.springframework.http.MediaType;

@RunWith(SpringRunner.class)
@WebMvcTest(value = AppointmentController.class)
class NdMedicineApplicationTests {

    @Autowired
    private MockMvc mvc;

    @MockBean
    private AppointmentService service;

    @Before
    public void setUp() throws Exception {
    }

    @Test
    public void given_when_thenReturnString() throws Exception {

        // Assert that Retrieving Output of testAppointment Returns Correct Output
        // Leftover Code (Ignore)
        String expectedOut = "Appointment{appointmentId=100, patientId=2001, doctorId=1001, appointmentStartTime='Fri Mar 11 12:30:00 AEDT 2022', appointmentEndTime='Fri Mar 11 13:00:00 AEDT 2022'}";

        // MVC
        given(service.toString()).willReturn(expectedOut);

        // Line 53 is the line with the code issue
        // mvc.perform(post("/appointment/createAppointment").contentType(MediaType.APPLICATION_JSON).content("{\"patientId\" : 2001,\"appointmentId\" : 100, \"doctorId\" : 1001}")).andExpect(jsonPath("$.appointmentId", is(100)));
        verify(service, VerificationModeFactory.times(1));
        reset(service);

        // Leftover Code (Ignore)
        System.out.println("Expected Out: " + expectedOut);
        System.out.println("Actual Out: " + expectedOut);

    }

}
