package com.example.nd_medicine.entity;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "DOCTORAVAILABILTIES")
public class Availability {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)

    @Column(name = "TableID")
    private Long availId;

    @Column(name = "DocID")
    private Long doctorId;

    @Column(name = "AvailableFrom")
    private Date startTime;

    @Column(name = "AvailableTo")
    private Date endTime;

//    @Column(name = "Booked")
//    private Boolean booked;

    public Availability() {
    }

    public Availability(Long availId, Long doctorId, Date startTime, Date endTime) {
        this.availId = availId;
        this.doctorId = doctorId;
        this.startTime = startTime;
        this.endTime = endTime;
    }

    public Long getAvailId() {
        return availId;
    }

    public void setAvailId(Long id) {
        this.availId = id;
    }

    public Long getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(Long doctorId) {
        this.doctorId = doctorId;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }
///to do booked boolean
//    public Boolean getBooked() {
//        return booked;
//    }
//
//    public void setBooked(Boolean booked) {
//        this.booked = booked;
//    }

    @Override
    public String toString() {
        return "AvailabilityTime{" +
                "availid=" + availId +
                ", doctorId=" + doctorId +
                ", startTime='" + startTime + '\'' +
                ", endTime='" + endTime + '\'' +
                '}';
    }
}