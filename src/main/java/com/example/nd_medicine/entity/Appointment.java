package com.example.nd_medicine.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import javax.persistence.*;
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
    private Date appointmentstartTime;
    @Column
    private Date appointmentendTime;
    @Column
    @JsonFormat(pattern="dd-MM-yyyy")
    private Date appointmentDate;

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

    public Date getAppointmentDate() {
        return appointmentDate;
    }

    public void setAppointmentDate(Date appointmentDate) {
        this.appointmentDate = appointmentDate;
    }
    public Date getStartTime() {
        return appointmentstartTime;
    }
    public void setStartTime(Date appointmentstartTime) {
        this.appointmentstartTime = appointmentstartTime;
    }
    public Date getEndTime() {
        return appointmentendTime;
    }

    public void setEndTime(Date appointmentendTime) {
        this.appointmentendTime = appointmentendTime;
    }
    @Override
    public String toString() {
        return "Appointment{" +
                "appointmentId=" + appointmentId +
                ", patientId=" + patientId +
                ", doctorId=" + doctorId +
                ", appointmentDate=" + appointmentDate +
                ", appointmentStartTime='" + appointmentstartTime + '\'' +
                ", appointmentEndTime='" + appointmentendTime + '\'' +
                '}';
    }
}
