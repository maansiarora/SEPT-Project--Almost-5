import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'loginSignUp.dart';

void main() => runApp(const bookingConfirmation());

class bookingConfirmation extends StatelessWidget {
  const bookingConfirmation({Key? key}) : super(key: key);

  //static const String _title = '';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //title: _title,
      home: Scaffold(
        //appBar: AppBar(title: const Text(_title)),
        body: MybookingConfirmation(),
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
            navigateAfterSeconds: const loginSignUp(),
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
