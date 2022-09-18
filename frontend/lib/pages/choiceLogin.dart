import 'package:flutter/material.dart';
import 'package:sept/pages/adminLogin.dart';
import 'loginSignUp.dart';
import 'patientLogin.dart';
import 'doctorLogin.dart';
import 'adminLogin.dart';

void main() => runApp(const choiceLogin());

class choiceLogin extends StatelessWidget {
  const choiceLogin({Key? key}) : super(key: key);

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
                MaterialPageRoute(builder: (context) => loginSignUp()),
              );
            },
            child: const Icon(Icons.arrow_back, color: Colors.black
                // add custom icons also
                ),
          ),
        ),
        body: const Scrollbar(child: MychoiceLogin()),
      ),
    );
  }
}

class MychoiceLogin extends StatefulWidget {
  const MychoiceLogin({Key? key}) : super(key: key);

  @override
  State<MychoiceLogin> createState() => _MychoiceLogin();
}

class _MychoiceLogin extends State<MychoiceLogin> {
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
                padding: const EdgeInsets.fromLTRB(30, 150, 30, 30),
                child: const Text(
                  'Would you like to login as a doctor, a patient, or the admin?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
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
                          builder: (context) => const doctorLogin()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    primary: Colors.deepPurple[300],
                  ),
                  child: const Text('Doctor',
                      style: TextStyle(
                        fontSize: 19,
                      )),
                )),
            Container(
                height: 70,
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const patientLogin()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    primary: Colors.deepPurple[300],
                  ),
                  child: const Text('Patient',
                      style: TextStyle(
                        fontSize: 19,
                      )),
                )),
            Container(
                height: 70,
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const adminLogin()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    primary: Colors.deepPurple[300],
                  ),
                  child: const Text('Admin',
                      style: TextStyle(
                        fontSize: 19,
                      )),
                )),
          ],
        ));
  }
}
