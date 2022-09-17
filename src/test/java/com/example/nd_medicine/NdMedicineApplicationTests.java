package com.example.nd_medicine;

import com.example.nd_medicine.entity.Appointment;
import org.aspectj.lang.annotation.Before;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import static org.junit.jupiter.api.Assertions.assertEquals;

@SpringBootTest
class NdMedicineApplicationTests {

    boolean result;

    // Create Appointment Object for Testing
    Appointment testAppointment = new Appointment();
    Date appointmentStart = new Date();
    Date appointmentEnd = new Date();
    Calendar myCalendar = new GregorianCalendar();

    @BeforeEach
    public void setup() {

        // Reset Testing Objects
        testAppointment.resetObject();
        myCalendar.clear();

    }

    @Test
    public void Test1() {

        // Hardcode Testing Object
        testAppointment.setId(100L);
        testAppointment.setDoctorId(1001L);
        testAppointment.setPatientId(2001L);

        // Set Date Objects
        myCalendar.set(2022, 2, 11, 12, 30, 00);
        testAppointment.setStartTime(myCalendar.getTime());
        myCalendar.set(2022, 2, 11, 13, 00, 00);
        testAppointment.setEndTime(myCalendar.getTime());

        // Assert that Retrieving Output of testAppointment Returns Correct Output
        String expectedOut = "Appointment{appointmentId=100, patientId=2001, doctorId=1001, appointmentStartTime='Fri Mar 11 12:30:00 AEDT 2022', appointmentEndTime='Fri Mar 11 13:00:00 AEDT 2022'}";
        assertEquals(expectedOut, testAppointment.toString());

        System.out.println("Expected Out: " + expectedOut);
        System.out.println("Actual Out: " + expectedOut);

    }

    @Test
    public void test2() {

        // Test 2


    }

}
