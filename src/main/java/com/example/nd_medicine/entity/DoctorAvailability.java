package com.example.nd_medicine.entity;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name="DoctorAvailabilities")
public class DoctorAvailability {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "TableID")
    private Integer id;

    @Column(name = "DocID")
    private Integer doctorID;

    @Column(name = "StartTime")
    private Date startTime;

    @Column(name = "EndTime")
    private Date endTime;

    @Column(name = "Booked")
    private Boolean booked;

    public DoctorAvailability() {

        // Empty Constructor

    }

    public DoctorAvailability(Integer id, Integer doctorID, Date startTime, Date endTime) {
        this.id = id;
        this.doctorID = doctorID;
        this.startTime = startTime;
        this.endTime = endTime;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getDoctorID() {
        return doctorID;
    }

    public void setDoctorID(Integer doctorID) {
        this.doctorID = doctorID;
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

    public Boolean getBooked() {
        return booked;
    }

    public void setBooked(Boolean booked) {
        this.booked = booked;
    }

}
