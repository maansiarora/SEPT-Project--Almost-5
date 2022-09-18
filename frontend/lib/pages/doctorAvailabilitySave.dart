import 'package:flutter/material.dart';
import 'doctorDashboard.dart';
import 'package:splashscreen/splashscreen.dart';

void main() => runApp(const doctorAvailabilitySave());

class doctorAvailabilitySave extends StatelessWidget {
  const doctorAvailabilitySave({Key? key}) : super(key: key);

  //static const String _title = '';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //title: _title,
      home: Scaffold(
        //appBar: AppBar(title: const Text(_title)),
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
        home: SplashScreen(
            seconds: 4,
            navigateAfterSeconds: const doctorDashboard(),
            title: const Text(
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
