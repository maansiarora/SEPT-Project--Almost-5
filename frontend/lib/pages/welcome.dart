import 'package:flutter/material.dart';
import 'loginSignUp.dart';
import 'package:splashscreen/splashscreen.dart';

void main() => runApp(const welcome());

class welcome extends StatelessWidget {
  const welcome({Key? key}) : super(key: key);

  //static const String _title = '';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //title: _title,
      home: Scaffold(
        //appBar: AppBar(title: const Text(_title)),
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
            seconds: 6,
            navigateAfterSeconds: const loginSignUp(),
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
