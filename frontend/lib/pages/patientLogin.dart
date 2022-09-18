import 'package:flutter/material.dart';
import 'patientDashboard.dart';
import 'choiceSignup.dart';
import 'choiceLogin.dart';

void main() => runApp(const patientLogin());

class patientLogin extends StatelessWidget {
  const patientLogin({Key? key}) : super(key: key);

  //static const String _title = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: _title,
      home: Scaffold(
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
            child: const Icon(Icons.arrow_back, color: Colors.black
                // add custom icons also
                ),
          ),
        ),
        body: MypatientLogin(),
      ),
    );
  }
}

class MypatientLogin extends StatefulWidget {
  const MypatientLogin({Key? key}) : super(key: key);

  @override
  State<MypatientLogin> createState() => _MypatientLogin();
}

class _MypatientLogin extends State<MypatientLogin> {
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
                  padding: const EdgeInsets.fromLTRB(30, 130, 30, 30),
                  child: const Text(
                    'Login as a Patient',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
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
              Container(
                  height: 140,
                  padding: const EdgeInsets.fromLTRB(30, 100, 30, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const patientDashboard()),
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
