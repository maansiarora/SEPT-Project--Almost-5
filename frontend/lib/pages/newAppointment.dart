import 'package:flutter/material.dart';

void main() => runApp(const newAppointment());

class newAppointment extends StatelessWidget {
  const newAppointment({Key? key}) : super(key: key);

  //static const String _title = '';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //title: _title,
      home: Scaffold(
        //appBar: AppBar(title: const Text(_title)),
        body: MynewAppointment(),
      ),
    );
  }
}

class MynewAppointment extends StatefulWidget {
  const MynewAppointment({Key? key}) : super(key: key);

  @override
  State<MynewAppointment> createState() => _MynewAppointment();
}

String dropdownValue = 'Choose specialization';

class _MynewAppointment extends State<MynewAppointment> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(children: <Widget>[
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(30, 100, 30, 35),
              child: const Text(
                'New Appointment',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              )),
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
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
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
                            },
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
                          )))
                ],
              ))
        ]));
  }
}
