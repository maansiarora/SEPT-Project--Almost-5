// importing the required packages and pages
import 'package:flutter/material.dart';
import 'Save.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'doctorDashboard.dart';

// this is the sign-up page for the patient
void main() => runApp(const doctorProfileDash());

class doctorProfileDash extends StatelessWidget {
  const doctorProfileDash({Key? key}) : super(key: key);

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
                MaterialPageRoute(builder: (context) => doctorDashboard()),
              );
            },
            child: const Icon(Icons.arrow_back, color: Colors.black),
          ),
        ),
        // adding scrollbar to the page
        body: const Scrollbar(child: MydoctorProfileDash()),
      ),
    );
  }
}

class MydoctorProfileDash extends StatefulWidget {
  const MydoctorProfileDash({Key? key}) : super(key: key);

  @override
  State<MydoctorProfileDash> createState() => _MydoctorProfileDash();
}

class _MydoctorProfileDash extends State<MydoctorProfileDash> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  get kPrimaryColor => null;

  bool _passwordVisible = true;

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
                    'Dr. Dummy Name',
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
                    hintText: "Name- Dr. Dummy Name",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                child: TextFormField(
                  minLines: 2,
                  maxLines: 5,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.multiline,
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
                    hintText:
                        "About \n\nHi i am suhavni! How are you!? This is me! I am not a doctor.",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                child: TextFormField(
                  minLines: 2,
                  maxLines: 5,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.multiline,
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
                    hintText: "Qualification\n\nFRACGP, MBBS (Hons), MRCP(UK)",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                child: TextFormField(
                  minLines: 2,
                  maxLines: 5,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.multiline,
                  controller: passwordController,
                  textInputAction: TextInputAction.done,
                  cursorColor: Colors.deepPurple,
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                    ),
                    //labelText: 'Password',
                    hintText:
                        "Experience\n\nDummy text - 12 years. Will be updated from the doctors end.",
                    // option for the user to hide or view the password
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                child: TextFormField(
                  minLines: 2,
                  maxLines: 5,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.multiline,
                  controller: passwordController,
                  textInputAction: TextInputAction.done,
                  cursorColor: Colors.deepPurple,
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                    ),
                    //labelText: 'Password',
                    hintText:
                        "Contact\n\n Phone: 04587348573\n Email: xyz@example.com",
                    // option for the user to hide or view the password
                  ),
                ),
              ),
              // save button
              Container(
                  height: 100,
                  padding: const EdgeInsets.fromLTRB(30, 40, 30, 20),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_FormKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Save()),
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
