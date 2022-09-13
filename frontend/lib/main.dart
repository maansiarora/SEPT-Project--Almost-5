import 'package:flutter/material.dart';
import 'pages/doctorSignUp.dart';
import 'pages/choiceLogin.dart';
import 'pages/patientSignUp.dart';

void main() => runApp(MaterialApp(initialRoute: '/choiceLogin', routes: {
      '/choiceLogin': (context) => const choiceLogin(),
      '/doctorSignUp': (context) => const doctorSignUp(),
      '/patientSignUp': (context) => const patientSignUp(),
    }));
