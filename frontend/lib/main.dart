import 'package:flutter/material.dart';
import 'package:sept/pages/doctorsProfile.dart';
import 'pages/doctorSignUp.dart';
import 'pages/choiceLogin.dart';
import 'pages/patientSignUp.dart';
import 'pages/choiceSignup.dart';
import 'pages/loginSignUp.dart';
import 'pages/doctorLogin.dart';
import 'pages/patientLogin.dart';
import 'pages/adminLogin.dart';
import 'pages/bookingMain.dart';
import 'pages/newAppointment.dart';
import 'pages/calender.dart';
import 'pages/doctorsProfile.dart';
import 'pages/appointmentSummary.dart';
import 'pages/bookingConfirmation.dart';
import 'pages/viewBooking.dart';

void main() => runApp(MaterialApp(initialRoute: '/bookingMain', routes: {
      '/choiceLogin': (context) => const choiceLogin(),
      '/doctorSignUp': (context) => const doctorSignUp(),
      '/patientSignUp': (context) => const patientSignUp(),
      '/choiceSignUp': (context) => const choiceSignUp(),
      '/loginSignUp': (context) => const loginSignUp(),
      '/doctorLogin': (context) => const doctorLogin(),
      '/patientLogin': (context) => const patientLogin(),
      '/adminLogin': (context) => const adminLogin(),
      '/bookingMain': (context) => const bookingMain(),
      '/newAppointment': (context) => const newAppointment(),
      '/calender': (context) => calender(),
      '/doctorsProfile': (context) => const doctorsProfile(),
      '/appointmentSummary': (context) => const appointmentSummary(),
      '/bookingConfirmation': (context) => const bookingConfirmation(),
      '/viewBooking': (context) => const viewBooking(),
    }));
