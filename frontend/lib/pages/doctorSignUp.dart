import 'package:flutter/material.dart';

import 'choiceLogin.dart';

void main() => runApp(const doctorSignUp());

class doctorSignUp extends StatelessWidget {
  const doctorSignUp({Key? key}) : super(key: key);

  //static const String _title = '';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //title: _title,
      home: Scaffold(
        //appBar: AppBar(title: const Text(_title)),
        body: MydoctorSignUp(),
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
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Form(
          child: Column(
            children: [
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.fromLTRB(30, 100, 30, 30),
                  child: const Text(
                    'Sign Up as a Doctor',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
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
              Container(
                  height: 100,
                  padding: const EdgeInsets.fromLTRB(30, 60, 30, 0),
                  child: ElevatedButton(
                    onPressed: () {},
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const choiceLogin()),
                      );
                      //signup screen
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
