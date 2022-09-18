import 'package:flutter/material.dart';
import 'viewBooking.dart';
import 'newAppointment.dart';
import 'patientDashboard.dart';

void main() => runApp(const bookingMain());

class bookingMain extends StatelessWidget {
  const bookingMain({Key? key}) : super(key: key);

  //static const String _title = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: _title,
      home: Scaffold(
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
            child: const Icon(Icons.arrow_back, color: Colors.black
                // add custom icons also
                ),
          ),
        ),
        body: MybookingMain(),
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
                padding: const EdgeInsets.fromLTRB(30, 150, 30, 80),
                child: const Text(
                  'Appointments',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
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
