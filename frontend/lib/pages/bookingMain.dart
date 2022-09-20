//importing required packages and pages
import 'package:flutter/material.dart';
import 'viewBooking.dart';
import 'newAppointment.dart';
import 'patientDashboard.dart';

// this page is for the patient to choose if they want to book a new appointment or view their past or existing appintments
void main() => runApp(const bookingMain());

class bookingMain extends StatelessWidget {
  const bookingMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // app bar with the back icon to go back to the previous page - dashboard
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          elevation: 0.0,
          leading: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => patientDashboard()),
              );
            },
            child: const Icon(Icons.arrow_back, color: Colors.black),
          ),
        ),

        // adding scrollbar to the page
        body: const Scrollbar(child: MybookingMain()),
      ),
    );
  }
}

class MybookingMain extends StatefulWidget {
  const MybookingMain({Key? key}) : super(key: key);

  @override
  State<MybookingMain> createState() => _MybookingMain();
}

class _MybookingMain extends State<MybookingMain> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(30, 100, 30, 20),
                child: const Text(
                  'Appointments',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                )),
            const Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                child: Divider(
                  color: Colors.black,
                )),

            // button to go further to make a new appointment
            Container(
                height: 70,
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const newAppointment()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    primary: Colors.deepPurple[300],
                  ),
                  child: const Text('New Appointment',
                      style: TextStyle(
                        fontSize: 19,
                      )),
                )),

            // button to view past or present appointments
            Container(
                height: 70,
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const viewBooking()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    primary: Colors.deepPurple[300],
                  ),
                  child: const Text('View Appointments',
                      style: TextStyle(
                        fontSize: 19,
                      )),
                )),
          ],
        ));
  }
}
