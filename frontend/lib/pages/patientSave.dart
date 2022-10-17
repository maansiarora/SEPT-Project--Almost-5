import 'package:flutter/material.dart';
import 'package:sept/pages/doctorDashboard.dart';
import 'patientDashboard.dart';
import 'package:splashscreen/splashscreen.dart';

void main() => runApp(const patientSave());

class patientSave extends StatelessWidget {
  const patientSave({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Scrollbar(child: MypatientSave()),
      ),
    );
  }
}

class MypatientSave extends StatefulWidget {
  const MypatientSave({Key? key}) : super(key: key);

  @override
  State<MypatientSave> createState() => _MypatientSave();
}

class _MypatientSave extends State<MypatientSave> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SplashScreen(
            seconds: 6,
            navigateAfterSeconds: const patientDashboard(),
            title: const Text(
              'Saving!',
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
