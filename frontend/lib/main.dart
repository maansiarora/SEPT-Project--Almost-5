import 'package:flutter/material.dart';
import 'pages/doctorSignUp.dart';
import 'pages/choiceLogin.dart';
import 'pages/patientSignUp.dart';
import 'pages/choiceSignup.dart';
import 'pages/loginSignUp.dart';

void main() => runApp(MaterialApp(initialRoute: '/loginSignUp', routes: {
      '/choiceLogin': (context) => const choiceLogin(),
      '/doctorSignUp': (context) => const doctorSignUp(),
      '/patientSignUp': (context) => const patientSignUp(),
      '/choiceSignUp': (context) => const choiceSignUp(),
      '/loginSignUp': (context) => const loginSignUp(),
    }));
