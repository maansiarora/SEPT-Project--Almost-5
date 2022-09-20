package com.example.nd_medicine;

import ch.qos.logback.core.CoreConstants;
import com.example.nd_medicine.controller.AppointmentController;
import com.example.nd_medicine.controller.UserController;
import com.example.nd_medicine.entity.Appointment;
import com.example.nd_medicine.entity.Doctor;
import com.example.nd_medicine.entity.Patient;
import com.example.nd_medicine.entity.User;
import com.example.nd_medicine.repository.AppointmentRepository;
import com.example.nd_medicine.repository.DoctorRepository;
import com.example.nd_medicine.repository.PatientRepository;
import com.example.nd_medicine.repository.SlotRepository;
import com.example.nd_medicine.security.Response;
import com.example.nd_medicine.security.SignUpResponse;
import com.example.nd_medicine.service.AppointmentService;
import com.example.nd_medicine.service.UserService;
import com.jayway.jsonpath.spi.json.GsonJsonProvider;
import org.hamcrest.CoreMatchers;
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
import static org.mockito.ArgumentMatchers.any;
import org.springframework.boot.test.mock.mockito.MockBean;
import static org.mockito.BDDMockito.given;
import org.mockito.Mockito;
import org.mockito.internal.verification.VerificationModeFactory;

import static org.mockito.Mockito.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultHandlers;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;

import java.time.LocalTime;
import java.util.Date;
import java.util.GregorianCalendar;

import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;

@RunWith(SpringRunner.class)
@WebMvcTest(value = AppointmentController.class)
class NdMedicineApplicationTests {

    @Autowired
    private MockMvc mvc;

    @MockBean
    private AppointmentService appointmentservice;

    @MockBean
    private DoctorRepository d_repository;

    @MockBean
    private PatientRepository p_repository;

    @MockBean
    private AppointmentRepository a_repository;

    @MockBean
    private SlotRepository s_repository;

    @Test
    public void givenValidAppointment_whenBookingAppointment_thenReturnAppointmentDetails() throws Exception {

        Doctor doctorTest = new Doctor("saiDoc", "kannan", "sai@gmail");
        Patient patientTest = new Patient("saiPatient", "kannan", "sai@gmail");

//        LocalTime timeTest = LocalTime.of(12, 30, 00);
//        Date dateTest = new GregorianCalendar(2022, 9, 20).getTime();

        Appointment testAppointment = new Appointment(5, doctorTest, patientTest);

        given(appointmentservice.create(Mockito.any())).willReturn(testAppointment);

        mvc.perform(post("/appointment/createAppointment")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(JsonUtil.toJson(testAppointment)))
                .andDo(MockMvcResultHandlers.print())
                .andExpect(MockMvcResultMatchers
                        .jsonPath("$.doctor.email", CoreMatchers.is(doctorTest.getEmail())))
                .andExpect(MockMvcResultMatchers
                        .jsonPath("$.patient.firstname", CoreMatchers.is(patientTest.getFirstname())))
                .andExpect(MockMvcResultMatchers
                        .jsonPath("$.id", CoreMatchers.is(testAppointment.getId())));

        verify(appointmentservice, VerificationModeFactory.times(1)).create(any());
        reset(appointmentservice);

    }

    @Test
    public void givenAppointmentId_whenRequestingAppointmentById_thenReturnAppointmentDetails() throws Exception {

        Doctor doctorTest = new Doctor("saiDoc", "kannan", "sai@gmail");
        Patient patientTest = new Patient("saiPatient", "kannan", "sai@gmail");

//        LocalTime timeTest = LocalTime.of(12, 30, 00);
//        Date dateTest = new GregorianCalendar(2022, 9, 20).getTime();

        Appointment testAppointment = new Appointment(5, doctorTest, patientTest);

        given(appointmentservice.findAppointmentByAppointmentId(Mockito.any())).willReturn(testAppointment);

        mvc.perform(get("/appointment/5"))
                .andDo(MockMvcResultHandlers.print())
                .andExpect(MockMvcResultMatchers
                        .jsonPath("$.doctor.email", CoreMatchers.is(doctorTest.getEmail())));

        verify(appointmentservice, VerificationModeFactory.times(1)).findAppointmentByAppointmentId(any());
        reset(appointmentservice);

    }
    @Test
    public void givenIncorrectAppointmentId_whenRequestingAppointmentById_thenReturnAppointmentDetails() throws Exception {

        Doctor doctorTest = new Doctor("saiDoc", "kannan", "sai@gmail");
        Patient patientTest = new Patient("saiPatient", "kannan", "sai@gmail");

//        LocalTime timeTest = LocalTime.of(12, 30, 00);
//        Date dateTest = new GregorianCalendar(2022, 9, 20).getTime();

        Appointment testAppointment = new Appointment(5, doctorTest, patientTest);
        Appointment emptyAppointment = new Appointment();

        a_repository.saveAndFlush(testAppointment);

        given(appointmentservice.findAppointmentByAppointmentId(Mockito.any())).willReturn(emptyAppointment);

        mvc.perform(get("/appointment/10"))
                .andDo(MockMvcResultHandlers.print())
                .andExpect(MockMvcResultMatchers
                        .jsonPath("$.id", CoreMatchers.is(emptyAppointment.getId())));

        verify(appointmentservice, VerificationModeFactory.times(1)).findAppointmentByAppointmentId(any());
        reset(appointmentservice);

    }

}