// importing the required packages and pages
import 'package:flutter/material.dart';
import 'package:sept/pages/patientDashboard.dart';
import 'package:sept/pages/patientSave.dart';
import 'Save.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'doctorDashboard.dart';

// this is the sign-up page for the patient
void main() => runApp(const patientProfileDash());

class patientProfileDash extends StatelessWidget {
  const patientProfileDash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // adding app bar with back icon to link to the previous page
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          elevation: 0.0,
          leading: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const patientDashboard()),
              );
            },
            child: const Icon(Icons.arrow_back, color: Colors.black),
          ),
        ),
        // adding scrollbar to the page
        body: const Scrollbar(child: MypatientProfileDash()),
      ),
    );
  }
}

class MypatientProfileDash extends StatefulWidget {
  const MypatientProfileDash({Key? key}) : super(key: key);

  @override
  State<MypatientProfileDash> createState() => _MypatientProfileDash();
}

class _MypatientProfileDash extends State<MypatientProfileDash> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  get kPrimaryColor => null;

  bool _passwordVisible = true;
  String dropdownValue = 'Select Gender';
  String dropdownValue1 = 'Select Blood group';

  final GlobalKey<FormState> _FormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        // creating the form to take the user input to pass it on to the backend
        Form(
          key: _FormKey,
          child: Column(
            children: [
              // different fields that we need the user to fill in while signing up
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
                  child: const Text(
                    'Patient Name',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  cursorColor: Colors.deepPurple,
                  onSaved: (email) {},
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                    ),
                    hintText: "Name- patient Dummy Name",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  cursorColor: Colors.deepPurple,
                  onSaved: (email) {},
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                    ),
                    hintText: "Phone: 0987654321",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  cursorColor: Colors.deepPurple,
                  onSaved: (email) {},
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                    ),
                    hintText: "Age: 27",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  cursorColor: Colors.deepPurple,
                  onSaved: (email) {},
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                    ),
                    hintText: "Blood Group: B+",
                  ),
                ),
              ),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.fromLTRB(40, 30, 40, 0),
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
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
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
                                  'Select Gender',
                                  'Male',
                                  'Female',
                                  'Other'
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
                                validator: MultiValidator(
                                  [
                                    RequiredValidator(errorText: 'Required*'),
                                  ],
                                ),
                              ))),
                    ],
                  )),
              // save button
              Container(
                  height: 100,
                  padding: const EdgeInsets.fromLTRB(30, 40, 30, 20),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_FormKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const patientSave()),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      primary: Colors.deepPurple[300],
                    ),
                    child: const Text('Save',
                        style: TextStyle(
                          fontSize: 19,
                        )),
                  )),

              // link to the login page if the account already exists
            ],
          ),
        ),
      ],
    );
  }
}
