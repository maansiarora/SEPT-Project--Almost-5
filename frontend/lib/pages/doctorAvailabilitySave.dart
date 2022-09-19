// importing the required packages and pages
import 'package:flutter/material.dart';
import 'doctorDashboard.dart';
import 'package:splashscreen/splashscreen.dart';

// this is the loading page which appears after the doctor hits save when they fill in their availability
void main() => runApp(const doctorAvailabilitySave());

class doctorAvailabilitySave extends StatelessWidget {
  const doctorAvailabilitySave({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        // adding scrollbar to the page
        body: Scrollbar(child: MydoctorAvailabilitySave()),
      ),
    );
  }
}

class MydoctorAvailabilitySave extends StatefulWidget {
  const MydoctorAvailabilitySave({Key? key}) : super(key: key);

  @override
  State<MydoctorAvailabilitySave> createState() => _MydoctorAvailabilitySave();
}

class _MydoctorAvailabilitySave extends State<MydoctorAvailabilitySave> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // the splash screen would appear for the time mentioned below
        home: SplashScreen(
            seconds: 4,
            // the screen that will appear after the loading screen
            navigateAfterSeconds: const doctorDashboard(),
            title: const Text(
              // the following text will be displayed on the screeen
              'Saving Changes',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  color: Colors.deepPurple),
            ),
            backgroundColor: Colors.white,
            styleTextUnderTheLoader: const TextStyle(),
            loaderColor: Colors.deepPurple));
  }
}
