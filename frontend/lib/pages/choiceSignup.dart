// importing required packages and pages
import 'package:flutter/material.dart';
import 'loginSignUp.dart';
import 'patientSignUp.dart';
import 'doctorSignUp.dart';

// this page gives an option to choose to be a doctor or a patient while signing up
void main() => runApp(const choiceSignUp());

class choiceSignUp extends StatelessWidget {
  const choiceSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // adding app bar with the back icon to go back to the previous page
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          elevation: 0.0,
          leading: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => loginSignUp()),
              );
            },
            child: const Icon(Icons.arrow_back, color: Colors.black),
          ),
        ),

        // adding scrollbar to the page
        body: const Scrollbar(child: MychoiceSignUp()),
      ),
    );
  }
}

class MychoiceSignUp extends StatefulWidget {
  const MychoiceSignUp({Key? key}) : super(key: key);

  @override
  State<MychoiceSignUp> createState() => _MychoiceSignUp();
}

class _MychoiceSignUp extends State<MychoiceSignUp> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            // asking the user about their choice to further take them to the respective sign-up page
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(30, 170, 30, 30),
                child: const Text(
                  'Are you a doctor or a patient?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                )),
            Container(
                height: 70,
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const doctorSignUp()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    primary: Colors.deepPurple[300],
                  ),
                  // signing up as a doctor
                  child: const Text('Doctor',
                      style: TextStyle(
                        fontSize: 19,
                      )),
                )),
            Container(
                height: 70,
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const patientSignUp()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    primary: Colors.deepPurple[300],
                  ),
                  // signing up as a patient
                  child: const Text('Patient',
                      style: TextStyle(
                        fontSize: 19,
                      )),
                )),
          ],
        ));
  }
}
