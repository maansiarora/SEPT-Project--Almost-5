package com.example.nd_medicine.entity;

import javax.persistence.*;

@Entity
@Table(name="Doctors")
public class Doctor {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "DocID")
    private Integer id;

    @Column(name = "FirstName")
    private String firstname;

    @Column(name = "LastName")
    private String lastname;

    @Column(name = "Phone")
    private Integer phone;

    @Column(name = "Specialise")
    private String specialise;

    @Column(name = "Clinic")
    private Integer cid;

    public Integer getId() { return id; }

    public void setId(Integer id) { this.id = id; }

    public String getFirstname() { return firstname; }

    public void setFirstname(String firstname) { this.firstname = firstname; }

    public String getLastname() { return lastname; }

    public void setLastname(String lastname) { this.lastname = lastname; }

    public Integer getPhone() { return phone; }

    public void setPhone(Integer phone) { this.phone = phone; }

    public String getSpecialise() { return specialise; }

    public void setSpecialise(String specialise) { this.specialise = specialise; }

    public Integer getClinicID() { return cid; }

    public void setClinicID(Integer clinicID) { this.cid = clinicID; }

    @Override
    public String toString() {
        return "Doctor{" +
                "id=" + id +
                ", firstname='" + firstname + '\'' +
                ", lastname='" + lastname + '\'' +
                ", phone=" + phone +
                ", specialise='" + specialise + '\'' +
                '}';
    }
}