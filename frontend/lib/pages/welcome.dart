// importing the libraries and packages to be used
import 'package:flutter/material.dart';
import 'loginSignUp.dart';
import 'package:splashscreen/splashscreen.dart';

// this page is the initial loading page for the app.
void main() => runApp(const welcome());

class welcome extends StatelessWidget {
  const welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        // adding scrollbar
        body: Scrollbar(child: Mywelcome()),
      ),
    );
  }
}

class Mywelcome extends StatefulWidget {
  const Mywelcome({Key? key}) : super(key: key);

  @override
  State<Mywelcome> createState() => _Mywelcome();
}

class _Mywelcome extends State<Mywelcome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SplashScreen(
            // time for which the screen should load
            seconds: 6,
            // the page which should be displayed next
            navigateAfterSeconds: const loginSignUp(),
            // text that needs to be appeared on the screen
            title: const Text(
              'ND Telemedicine!',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0,
                  color: Colors.deepPurple),
            ),
            backgroundColor: Colors.white,
            styleTextUnderTheLoader: const TextStyle(),
            loaderColor: Colors.deepPurple));
  }
}
