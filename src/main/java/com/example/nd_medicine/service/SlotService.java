package com.example.nd_medicine.service;

import com.example.nd_medicine.entity.AuthenticationLogin;
import com.example.nd_medicine.entity.Availability;
import com.example.nd_medicine.entity.Doctor;
import com.example.nd_medicine.entity.Slot;
import com.example.nd_medicine.repository.AuthenticationRepository;
import com.example.nd_medicine.repository.DoctorRepository;
import com.example.nd_medicine.repository.SlotRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.Duration;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

@Service
public class SlotService {

    @Autowired
    SlotRepository slotRepository;

    @Autowired
    DoctorRepository doctorRepository;

    public List<LocalTime> slotCreater() {
        int gapInMinutes = 30;  // Define your span-of-time.
        int loops = ((int) Duration.ofHours(24).toMinutes() / gapInMinutes);
        List<LocalTime> times = new ArrayList<>(loops);

        LocalTime time = LocalTime.MIN;  // '00:00'
        for (int i = 1; i <= loops; i++) {
            times.add(time);
            // Set up next loop.
            time = time.plusMinutes(gapInMinutes);
        }


        //testing purpsoses
        System.out.println(times);

        return times;
    }



    public void saveSlot(Slot slot) {
        slotRepository.save(slot);

    }

    public void initiateSlotsIntoDb(){

        //create slots
        List<LocalTime> times = slotCreater();

        //test
        Doctor doctorTest = new Doctor("sai", "kannan", "sai@gmail");
        doctorRepository.save(doctorTest);

        for (int i = 0 ; i < times.size(); i++){
            //test
            Slot slot = new Slot();

            slot.setDoctor(doctorTest);
            slot.setSlotTime(times.get(i));

            saveSlot(slot);



        }
    }
}

