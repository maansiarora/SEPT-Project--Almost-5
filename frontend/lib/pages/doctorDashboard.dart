import 'package:flutter/material.dart';
import 'chatMenu.dart';
import 'doctorAvailability.dart';

void main() => runApp(const doctorDashboard());

class doctorDashboard extends StatelessWidget {
  const doctorDashboard({Key? key}) : super(key: key);

  //static const String _title = '';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //title: _title,
      home: Scaffold(
        //appBar: AppBar(title: const Text(_title)),
        body: Scrollbar(child: MydoctorDashboard()),
      ),
    );
  }
}

class MydoctorDashboard extends StatefulWidget {
  const MydoctorDashboard({Key? key}) : super(key: key);

  @override
  State<MydoctorDashboard> createState() => _MydoctorDashboard();
}

class _MydoctorDashboard extends State<MydoctorDashboard> {
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
                padding: const EdgeInsets.fromLTRB(30, 100, 30, 0),
                child: const Text(
                  'Dr. Dummy Name',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                child: const Text(
                  'Specialization',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                )),
            const Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 5),
                child: Divider(
                  color: Colors.black,
                )),
            Container(
                height: 100,
                padding: const EdgeInsets.fromLTRB(50, 51, 50, 0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TextScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    primary: Colors.deepPurple[300],
                  ),
                  child: const Text('Availability',
                      style: TextStyle(
                        fontSize: 19,
                      )),
                )),
            Container(
                height: 90,
                padding: const EdgeInsets.fromLTRB(50, 40, 50, 0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const chatMenu()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    primary: Colors.deepPurple[300],
                  ),
                  child: const Text('Chat',
                      style: TextStyle(
                        fontSize: 19,
                      )),
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(30, 200, 30, 20),
                child: const Text(
                  'Fix Me Page',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                )),
          ],
        ));
  }
}
