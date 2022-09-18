import 'package:flutter/material.dart';
import 'choiceSignup.dart';
import 'choiceLogin.dart';

void main() => runApp(const loginSignUp());

class loginSignUp extends StatelessWidget {
  const loginSignUp({Key? key}) : super(key: key);

  //static const String _title = 'Sample App';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //title: _title,
      home: Scaffold(
        //appBar: AppBar(title: const Text(_title)),
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
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(10, 90, 10, 0),
                child: const Text(
                  'Hey There!',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 30),
                )),
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
            Container(
                height: 70,
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const choiceSignUp()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    primary: Colors.deepPurple[300],
                  ),
                  child: const Text('Sign-Up',
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
                      fontWeight: FontWeight.w500,
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
        ));
  }
}
