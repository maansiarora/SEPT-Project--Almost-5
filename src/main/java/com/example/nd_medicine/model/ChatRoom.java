package com.example.nd_medicine.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.Id;
//import org.springframework.data.jpa.
//        mongodb.core.mapping.Document;
//import org.springframework.data.jpa.mapping.JpaMetamodelMappingContext;
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
//@Document
public class ChatRoom {
    @Id
    private String id;
    private String chatId;
    private String senderId;
    private String recipientId;
}
