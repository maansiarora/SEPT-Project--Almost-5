// importing the required packages and pages
import 'package:flutter/material.dart';
import 'newAppointment.dart';
import 'calender.dart';

// this page displays the profile of the doctor that the patient has chosen to book an appointment with
void main() => runApp(const doctorsProfile());

class doctorsProfile extends StatelessWidget {
  const doctorsProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // creating the app bar with a back icon to go back to the previous page
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          elevation: 0.0,
          leading: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => newAppointment()),
              );
            },
            child: const Icon(Icons.arrow_back, color: Colors.black),
          ),
        ),

        // adding scrollbar to the page
        body: const Scrollbar(child: MydoctorsProfile()),
      ),
    );
  }
}

class MydoctorsProfile extends StatefulWidget {
  const MydoctorsProfile({Key? key}) : super(key: key);

  @override
  State<MydoctorsProfile> createState() => _MydoctorsProfile();
}

class _MydoctorsProfile extends State<MydoctorsProfile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            // different fields saved in by the doctor on their profile that are to be displayed
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
                child: const Text(
                  'Dr Dummy Name',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                )),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: const Text(
                'Qualification, Male\nFRACGP, MBBS (Hons)',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
            ),
            const Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                child: Divider(
                  color: Colors.black12,
                )),
            Container(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                child: const Text(
                  'Contact Details',
                  //textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                )),
            Container(
                padding: const EdgeInsets.fromLTRB(30, 5, 30, 20),
                child: const Text(
                  'Email Id: doctor@gmail.com\nContact No.: ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                )),
            const Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 10),
                child: Divider(
                  color: Colors.black12,
                )),
            Container(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: const Text(
                  'About',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                )),
            Container(
                padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
                child: const Text(
                  'This is a dummy text. This will be updated by the doctor from their end while building up the profile. It may contain their background, interests, etc.',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                )),
            const Padding(
                padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: Divider(
                  color: Colors.black12,
                )),
            Container(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: const Text(
                  'Experience',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                )),
            Container(
                padding: const EdgeInsets.fromLTRB(30, 5, 30, 30),
                child: const Text(
                  'Dummy text - 12 years. Will be updated from the doctors end.',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                )),
            Container(
                height: 70,
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => calender()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    primary: Colors.deepPurple[300],
                  ),
                  child: const Text('See Available Times',
                      style: TextStyle(
                        fontSize: 19,
                      )),
                )),
          ],
        ));
  }
}
