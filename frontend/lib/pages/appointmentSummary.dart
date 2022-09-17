import 'package:flutter/material.dart';
import 'package:sept/pages/bookingConfirmation.dart';
import 'package:sept/pages/newAppointment.dart';
import 'bookingConfirmation.dart';
import 'newAppointment.dart';

void main() => runApp(const appointmentSummary());

class appointmentSummary extends StatelessWidget {
  const appointmentSummary({Key? key}) : super(key: key);

  //static const String _title = '';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //title: _title,
      home: Scaffold(
        //appBar: AppBar(title: const Text(_title)),
        body: MyappointmentSummary(),
      ),
    );
  }
}

class MyappointmentSummary extends StatefulWidget {
  const MyappointmentSummary({Key? key}) : super(key: key);

  @override
  State<MyappointmentSummary> createState() => _MyappointmentSummary();
}

class _MyappointmentSummary extends State<MyappointmentSummary> {
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
                padding: const EdgeInsets.fromLTRB(30, 150, 30, 70),
                child: const Text(
                  'Please confirm your booking details',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                )),
            Container(
              //alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(80, 10, 50, 5),
              child: const Text.rich(
                TextSpan(
                  children: <InlineSpan>[
                    WidgetSpan(
                        child: Icon(
                      Icons.calendar_month_outlined,
                      size: 25,
                    )),
                    TextSpan(
                        text: ' Day, Date, 2022',
                        style: TextStyle(fontSize: 22)),
                  ],
                ),
              ),
            ),
            Container(
              //alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(80, 10, 50, 5),
              child: const Text.rich(
                TextSpan(
                  children: <InlineSpan>[
                    WidgetSpan(
                        child: Icon(
                      Icons.access_time_outlined,
                      size: 25,
                    )),
                    TextSpan(text: ' Time', style: TextStyle(fontSize: 22)),
                  ],
                ),
              ),
            ),
            Container(
              //alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(80, 10, 50, 5),
              child: const Text.rich(
                TextSpan(
                  children: <InlineSpan>[
                    WidgetSpan(
                        child: Icon(
                      Icons.medical_services_outlined,
                      size: 25,
                    )),
                    TextSpan(
                      text: ' Dr Dummy Name',
                      style: TextStyle(
                        fontSize: 22,
                        //fontWeight: FontWeight.w100,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              //alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(80, 10, 50, 70),
              child: const Text.rich(
                TextSpan(
                  children: <InlineSpan>[
                    WidgetSpan(
                        child: Icon(
                      Icons.message_outlined,
                      size: 25,
                    )),
                    TextSpan(text: ' via Chat', style: TextStyle(fontSize: 22)),
                  ],
                ),
              ),
            ),
            Wrap(
              children: <Widget>[
                Container(
                    width: 180,
                    height: 70,
                    padding: const EdgeInsets.fromLTRB(30, 20, 20, 0),
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
                      child: const Text('Cancel',
                          style: TextStyle(
                            fontSize: 19,
                          )),
                    )),
                Container(
                    width: 180,
                    height: 70,
                    padding: const EdgeInsets.fromLTRB(30, 20, 20, 0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const bookingConfirmation()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        primary: Colors.deepPurple[300],
                      ),
                      child: const Text('Confirm',
                          style: TextStyle(
                            fontSize: 19,
                          )),
                    ))
              ],
            )
          ],
        ));
  }
}
