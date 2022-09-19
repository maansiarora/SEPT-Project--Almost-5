// importing the required packages and pages
import 'package:flutter/material.dart';
import 'choiceSignup.dart';
import 'choiceLogin.dart';
import 'doctorDashboard.dart';

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
                MaterialPageRoute(builder: (context) => choiceSignUp()),
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

class _MydoctorSignUp extends State<MydoctorSignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  get kPrimaryColor => null;

  bool _passwordVisible = true;
  String dropdownValue = 'Choose specialization';
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        // Form() to get the user input so that we can pass it on to the backend
        Form(
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
                    hintText: "First Name",
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.person,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                child: TextFormField(
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
                    hintText: "Last Name",
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.person,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                child: TextFormField(
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
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                child: TextFormField(
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
                              ))),
                    ],
                  )),

              // the final signup button
              Container(
                  height: 100,
                  padding: const EdgeInsets.fromLTRB(30, 50, 30, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const doctorDashboard()),
                      );
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
