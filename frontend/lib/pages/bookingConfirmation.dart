import 'package:flutter/material.dart';
import 'patientDashboard.dart';
import 'package:splashscreen/splashscreen.dart';

void main() => runApp(const bookingConfirmation());

class bookingConfirmation extends StatelessWidget {
  const bookingConfirmation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Scrollbar(child: MybookingConfirmation()),
      ),
    );
  }
}

class MybookingConfirmation extends StatefulWidget {
  const MybookingConfirmation({Key? key}) : super(key: key);

  @override
  State<MybookingConfirmation> createState() => _MybookingConfirmation();
}

class _MybookingConfirmation extends State<MybookingConfirmation> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SplashScreen(
            seconds: 6,
            navigateAfterSeconds: const patientDashboard(),
            title: const Text(
              'Booking Confirmed!',
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
