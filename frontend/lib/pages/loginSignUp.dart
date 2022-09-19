// importing packages and other pages
import 'package:flutter/material.dart';
import 'choiceSignup.dart';
import 'choiceLogin.dart';

void main() => runApp(const loginSignUp());

class loginSignUp extends StatelessWidget {
  const loginSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        // adding scrollbar to the page
        body: Scrollbar(child: MyloginSignUp()),
      ),
    );
  }
}

class MyloginSignUp extends StatefulWidget {
  const MyloginSignUp({Key? key}) : super(key: key);

  @override
  State<MyloginSignUp> createState() => _MyloginSignUp();
}

class _MyloginSignUp extends State<MyloginSignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        // adding a constant padding to the page
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            // particular container for the text
            Container(
                // alignment of the text
                alignment: Alignment.center,
                // padding for the welcome text
                padding: const EdgeInsets.fromLTRB(10, 90, 10, 0),
                // text to be displayed
                child: const Text(
                  'Hey There!',
                  // formatting the displayed text
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 30),
                )),

            // another container for the text
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(30, 50, 30, 200),
                child: const Text(
                  'Skip the hassle & get complete telemedicine solutions for you and your family.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                )),

            // creating the "SignUp" button and linking it to whatever page it should take us to
            Container(
                height: 70,
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                child: ElevatedButton(
                  // linking the pages
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const choiceSignUp()),
                    );
                  },
                  // styling the button
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    primary: Colors.deepPurple[300],
                  ),
                  // text on the button
                  child: const Text('Sign-Up',
                      style: TextStyle(
                        fontSize: 19,
                      )),
                )),

            // login option if the account exists
            // Row() used to put both the text and the link in the same line
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Already have an account?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    )),
                TextButton(
                  child: const Text('Login',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.deepPurple,
                      )),
                  // linking the login to the login page
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
        ));
  }
}
