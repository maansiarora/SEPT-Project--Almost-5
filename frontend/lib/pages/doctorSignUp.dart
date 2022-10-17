// importing the required packages and pages
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../model/EmployeeModel.dart';
//import 'pages/model/doctorSignUpModel.dart';
import '../model/doctorSignUpModel.dart';
import 'choiceSignup.dart';
import 'choiceLogin.dart';
import 'doctorDashboard.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:http/http.dart' as http;

// this is the sign-up page for the doctor
void main() => runApp(const doctorSignUp());

class doctorSignUp extends StatelessWidget {
  const doctorSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // adding the app bar with the back icon to go to the previous page
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          elevation: 0.0,
          // linking the icon to the previous page
          leading: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const choiceSignUp()),
              );
            },
            child: const Icon(Icons.arrow_back,
                color: Colors.black // add custom icons also
                ),
          ),
        ),

        // adding scrollbar to the page
        body: const Scrollbar(child: MydoctorSignUp()),
      ),
    );
  }
}

class MydoctorSignUp extends StatefulWidget {
  const MydoctorSignUp({Key? key}) : super(key: key);

  @override
  State<MydoctorSignUp> createState() => _MydoctorSignUp();
}

/*Future<doctorSignUpModel> registerEmployees(
    String firstName, String lastName, BuildContext context) async {
  var Url = "http://10.0.2.2:8080/user/signup/doctor";
  var response = await http.post(Url,
      headers: <String, String>{"Content-Type": "application/json"},
      body: jsonEncode(<String, String>{
        "firstName": firstName,
        "lastName": lastName,
      }));
  throw '';
}*/

Future<doctorSignUpModel> createUser(
  String password,
  String firstname,
  String lastname,
) async {
  final response = await http.post(
    Uri.parse('http://10.0.2.2:8080/user/signup/doctor'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'firstname': firstname,
      'lastname': lastname,
      'password': password,
    }),
  );

  if (response.statusCode == 201) {
    return doctorSignUpModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create User.');
  }
}

class _MydoctorSignUp extends State<MydoctorSignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  late doctorSignUpModel doc;

  get kPrimaryColor => null;

  bool _passwordVisible = true;
  String dropdownValue = 'Choose specialization';

  //String lastname = "";
  final GlobalKey<FormState> _FormKey = GlobalKey<FormState>();
  bool isPushData = false;
  String firstname = "";
  String lastname = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    String lastname;
    return ListView(
      children: <Widget>[
        // Form() to get the user input so that we can pass it on to the backend
        Form(
          key: _FormKey,
          child: Column(
            children: [
              // heading text to be displayed
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
                  child: const Text(
                    'Sign Up as a Doctor',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  )),

              // different fields that the user needs to put in like name, email-id, and setting the password
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.text,
                  controller: nameController,
                  textInputAction: TextInputAction.next,
                  cursorColor: Colors.deepPurple,
                  onSaved: (value) {},
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                    ),
                    hintText: "First Name",
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.person,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                  validator: MultiValidator(
                    [
                      RequiredValidator(errorText: 'Required*'),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.text,
                  controller: lastnameController,
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
                    hintText: "Last Name",
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.person,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                  validator: MultiValidator(
                    [
                      RequiredValidator(errorText: 'Required*'),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.emailAddress,
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
                    hintText: "Email-Id",
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.mail,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                  validator: MultiValidator(
                    [
                      RequiredValidator(errorText: 'Required*'),
                      EmailValidator(errorText: 'Invalid Email*')
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.text,
                  controller: passwordController,
                  textInputAction: TextInputAction.done,
                  obscureText: _passwordVisible,
                  cursorColor: Colors.deepPurple,
                  decoration: InputDecoration(
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple),
                      ),
                      //labelText: 'Password',
                      hintText: "Password",
                      prefixIcon: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(
                          Icons.lock,
                          color: Colors.deepPurple,
                        ),
                      ),
                      // giving an option for the user to hide or view their password
                      suffixIcon: IconButton(
                          icon: Icon(_passwordVisible
                              ? Icons.visibility_off
                              : Icons.visibility),
                          color: Colors.grey,
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          })),
                  validator: MultiValidator(
                    [
                      RequiredValidator(errorText: 'Required*'),
                    ],
                  ),
                ),
              ),
              // the doctor will have to select their specialization while signing up
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
                                validator: MultiValidator(
                                  [
                                    RequiredValidator(errorText: 'Required*'),
                                  ],
                                ),
                              ))),
                    ],
                  )),

              // the final signup button
              Container(
                  height: 150,
                  padding: const EdgeInsets.fromLTRB(30, 80, 30, 20),
                  child: ElevatedButton(
                    onPressed: () {
                      print(nameController.text);
                      print(lastnameController.text);
                      print(passwordController.text);
                      createUser(nameController.text, lastnameController.text,
                          passwordController.text);
                      setState(() {
                        isPushData = true;
                      });
                      Future.delayed(const Duration(seconds: 2))
                          .then((value) => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const doctorDashboard()),
                              ));
                      /*if (_FormKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const doctorDashboard()),
                        );
                      }*/
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      primary: Colors.deepPurple[300],
                    ),
                    child: const Text('SIGN UP',
                        style: TextStyle(
                          fontSize: 19,
                        )),
                  )),

              // if the user already has an account, they can login by clicking on the login text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Already have an account?',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      )),
                  TextButton(
                    child: const Text('Login',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.deepPurple,
                        )),
                    // linking
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const choiceLogin()),
                      );
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
