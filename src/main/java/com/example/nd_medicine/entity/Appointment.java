package com.example.nd_medicine.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import javax.persistence.*;
import javax.swing.text.DateFormatter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

@Entity
@Table(name = "APPOINTMENTS")
public class Appointment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long appointmentId;
    @Column
    private Long patientId;
    @Column
    private Long doctorId;
    @Column
    private Date appointmentStartTime;
    @Column
    private Date appointmentEndTime;

    public Long getId() {
        return appointmentId;
    }

    public void setId(Long appointmentId) {
        this.appointmentId = appointmentId;
    }

    public Long getPatientId() {
        return patientId;
    }

    public void setPatientId(Long patientId) {
        this.patientId = patientId;
    }

    public Long getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(Long doctorId) {
        this.doctorId = doctorId;
    }

    public Date getStartTime() {
        return appointmentStartTime;
    }
    public void setStartTime(Date appointmentStartTime) {
        this.appointmentStartTime = appointmentStartTime;
    }
    public Date getEndTime() {
        return appointmentEndTime;
    }
    public void setEndTime(Date appointmentEndTime) {
        this.appointmentEndTime = appointmentEndTime;
    }
    @Override
    public String toString() {
        return "Appointment{" +
                "appointmentId=" + appointmentId +
                ", patientId=" + patientId +
                ", doctorId=" + doctorId +
                ", appointmentStartTime='" + appointmentStartTime + '\'' +
                ", appointmentEndTime='" + appointmentEndTime + '\'' +
                '}';
    }

    public void resetObject() {

        this.appointmentId = null;
        this.patientId = null;
        this.doctorId = null;
        this.appointmentStartTime = null;
        this.appointmentEndTime = null;

    }
}
