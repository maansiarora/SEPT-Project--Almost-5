// importing the required packages
import 'package:flutter/material.dart';

// this page is for the patient to view their upcoming appointments or past appointments
void main() => runApp(const viewBooking());

class viewBooking extends StatelessWidget {
  const viewBooking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        // adding scrollbar to the page
        body: Scrollbar(child: MyviewBooking()),
      ),
    );
  }
}

class MyviewBooking extends StatefulWidget {
  const MyviewBooking({Key? key}) : super(key: key);

  @override
  State<MyviewBooking> createState() => _MyviewBooking();
}

String dropdownValue = 'Select Option';
List<String> message = [];

class _MyviewBooking extends State<MyviewBooking> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(children: <Widget>[
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(30, 150, 30, 35),
              child: const Text(
                'View Booking',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              )),

          // a dropdown to choose if the user wants to view upcoming appointments or past appointments
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
              child: Row(
                children: [
                  Flexible(
                      flex: 1,
                      child: Material(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(60),
                          elevation: 5.0,
                          shadowColor: Colors.grey,
                          child: DropdownButtonFormField(
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(60),
                                    borderSide: BorderSide.none),
                                prefixIcon: const Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Icon(
                                    Icons.menu,
                                    color: Colors.deepPurple,
                                  ),
                                )),
                            dropdownColor: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            value: dropdownValue,
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                              });
                              function();
                            },
                            items: <String>[
                              'Select Option',
                              'Upcoming Appointments',
                              'Past Appointments'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.black54),
                                ),
                              );
                            }).toList(),
                          ))),
                ],
              )),

          // list of appointments that will be displayed according to whatever option is chosen from the above dropdown
          Container(
              height: 300,
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
              child: ListView.builder(
                itemCount: message.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    shape: const Border(
                      bottom: BorderSide(width: 2.0, color: Colors.purple),
                    ),
                    title: Text('${message[index]}'),
                  );
                },
              )),
        ]));
  }

  // hard coding dummy values about the appointment details for now
  void function() {
    List<String> status;
    if (dropdownValue == 'Upcoming Appointments') {
      status = [
        'Dr. One - 01/10/2022 - 10:00-10:30',
        'Dr. Two - 03/10/2022 - 12:00-13:30',
        'Dr. One - 05/10/2022 - 9:00-9:30'
      ];
      setState(() => message = status);
    } else if (dropdownValue == 'Past Appointments') {
      status = [
        'Dr. Two - 08/08/2022 - 11:00-11:30',
        'Dr. One - 23/08/2022 - 10:00-10:30',
        'Dr. Three - 29/08/2022 - 14:30-15:00'
      ];
      setState(() => message = status);
    } else if (dropdownValue == 'Select Option') {
      status = ['Please Select Option'];
      setState(() => message = status);
    }
  }
}
