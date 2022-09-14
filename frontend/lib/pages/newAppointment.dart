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

class _MynewAppointment extends State<MynewAppointment> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String dropdownvalue = 'Select Specialization';

  // List of items in our dropdown menu
  var items = [
    'Select Specialization',
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
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
                                  color: Colors.grey, fontSize: 18),
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
              child: DropdownButton(
                // Initial Value

                value: dropdownvalue,

                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),

                // Array list of items
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(
                      items,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                },
              ),
            ),
          ],
        ));
  }
}
