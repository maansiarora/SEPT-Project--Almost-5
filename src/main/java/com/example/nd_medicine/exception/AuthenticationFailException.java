package com.example.nd_medicine.exception;

public class AuthenticationFailException extends IllegalArgumentException{

    public AuthenticationFailException(String message){
        super(message);
    }
}
