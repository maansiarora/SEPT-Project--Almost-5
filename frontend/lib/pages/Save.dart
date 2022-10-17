import 'package:flutter/material.dart';
import 'package:sept/pages/doctorDashboard.dart';
import 'patientDashboard.dart';
import 'package:splashscreen/splashscreen.dart';

void main() => runApp(const Save());

class Save extends StatelessWidget {
  const Save({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Scrollbar(child: MySave()),
      ),
    );
  }
}

class MySave extends StatefulWidget {
  const MySave({Key? key}) : super(key: key);

  @override
  State<MySave> createState() => _MySave();
}

class _MySave extends State<MySave> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SplashScreen(
            seconds: 6,
            navigateAfterSeconds: const doctorDashboard(),
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
