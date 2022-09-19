// importing all the packages and pages
import 'package:flutter/material.dart';
import 'doctorsProfile.dart';
import 'bookingMain.dart';

// this page is for the patient to search doctors on the basis of their name or specialization
void main() => runApp(const newAppointment());

class newAppointment extends StatelessWidget {
  const newAppointment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // app bar with the back icon to go to the previous page
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          elevation: 0.0,
          leading: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => bookingMain()),
              );
            },
            child: const Icon(Icons.arrow_back, color: Colors.black),
          ),
        ),

        // adding scrollbar to the page
        body: const Scrollbar(child: MynewAppointment()),
      ),
    );
  }
}

class MynewAppointment extends StatefulWidget {
  const MynewAppointment({Key? key}) : super(key: key);

  @override
  State<MynewAppointment> createState() => _MynewAppointment();
}

// creating the default option of the dropdown
String dropdownValue = 'Choose specialization';
// creating the empty list for storing dummy values for now
List<String> message = [];

class _MynewAppointment extends State<MynewAppointment> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(children: <Widget>[
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 35),
              child: const Text(
                'New Appointment',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              )),

          // adding a search bar for the user to search the doctors by their name
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(30, 40, 30, 30),
              child: Row(children: [
                Flexible(
                  flex: 1,
                  child: Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(60),
                      elevation: 5.0,
                      shadowColor: Colors.grey,
                      child: TextFormField(
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(60),
                                borderSide: BorderSide.none),
                            hintText: 'Search by Doctor',
                            hintStyle: const TextStyle(
                                color: Colors.black54, fontSize: 18),
                            prefixIcon: const Padding(
                              padding: EdgeInsets.all(10),
                              child: Icon(
                                Icons.search,
                                color: Colors.deepPurple,
                              ),
                            )),
                      )),
                )
              ])),

          // creating a dropbox for the patient to choose the specialization of the doctor
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
                            // hardcoding the dropdown list for now
                            items: <String>[
                              'Choose specialization',
                              'General Practitioner',
                              'Dentist'
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

          // displaying the list of relevant doctors from the chosen option
          Container(
              height: 300,
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
              child: ListView.builder(
                itemCount: message.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const doctorsProfile()),
                      );
                    },
                    shape: const Border(
                      bottom: BorderSide(width: 0.5, color: Colors.black),
                    ),
                    title: Text('${message[index]}'),
                  );
                },
              )),
        ]));
  }

  // hardcoding the list doctors for now
  void function() {
    List<String> status;
    if (dropdownValue == 'Dentist') {
      status = ['Dr. Dentist 1', 'Dr. Dentist 2', 'Dr. Dentist 3'];
      setState(() => message = status);
    } else if (dropdownValue == 'General Practitioner') {
      status = ['Dr. GP 1', 'Dr. GP 2', 'Dr. GP 3'];
      setState(() => message = status);
    } else if (dropdownValue == 'Choose specialization') {
      status = ['Please Select Specialization'];
      setState(() => message = status);
    }
  }
}
