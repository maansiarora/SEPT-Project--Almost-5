// importing the required packages and pages
import 'package:flutter/material.dart';
import 'choiceLogin.dart';
import 'choiceSignup.dart';
import 'doctorDashboard.dart';

// this page is for the doctor logging in to their account
void main() => runApp(const doctorLogin());

class doctorLogin extends StatelessWidget {
  const doctorLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // creating the app bar with the back option
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          elevation: 0.0,
          leading: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => choiceLogin()),
              );
            },
            child: const Icon(Icons.arrow_back, color: Colors.black),
          ),
        ),

        // adding the scrollbar to the page
        body: const Scrollbar(child: MydoctorLogin()),
      ),
    );
  }
}

class MydoctorLogin extends StatefulWidget {
  const MydoctorLogin({Key? key}) : super(key: key);

  @override
  State<MydoctorLogin> createState() => _MydoctorLogin();
}

class _MydoctorLogin extends State<MydoctorLogin> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  get kPrimaryColor => null;

  bool _passwordVisible = true;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        // creating a form for the user to fill in their details for logging in
        Form(
          child: Column(
            children: [
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.fromLTRB(30, 130, 30, 30),
                  child: const Text(
                    'Login as a Doctor',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  )),

              // different fields to be filled
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 80, 30, 0),
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
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
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

              // login button which would take the user to their dashboard if the provided details are correct
              Container(
                  height: 140,
                  padding: const EdgeInsets.fromLTRB(30, 100, 30, 0),
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
                    child: const Text('Login',
                        style: TextStyle(
                          fontSize: 19,
                        )),
                  )),

              // link to sign-up if the account doesn't exist already
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text("Don't have an account already?",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      )),
                  TextButton(
                    child: const Text('Sign Up',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.deepPurple,
                        )),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const choiceSignUp()),
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
