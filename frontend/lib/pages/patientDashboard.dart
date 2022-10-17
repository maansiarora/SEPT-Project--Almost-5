// importing different packages and pages
import 'package:flutter/material.dart';
import 'bookingMain.dart';
import 'chatMenu.dart';
import 'medicinePatient.dart';

// this page is the patient's dashboard.
// it still needs to be made properly.
void main() => runApp(const patientDashboard());

class patientDashboard extends StatelessWidget {
  const patientDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        // adding scrollbar to the page
        body: Scrollbar(child: MypatientDashboard()),
      ),
    );
  }
}

class MypatientDashboard extends StatefulWidget {
  const MypatientDashboard({Key? key}) : super(key: key);

  @override
  State<MypatientDashboard> createState() => _MypatientDashboard();
}

class _MypatientDashboard extends State<MypatientDashboard> {
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
                  'Patient Dummy Name',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                )),
            const Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
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
                          builder: (context) => const bookingMain()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    primary: Colors.deepPurple[300],
                  ),
                  child: const Text('Booking',
                      style: TextStyle(
                        fontSize: 19,
                      )),
                )),
            Container(
                height: 100,
                padding: const EdgeInsets.fromLTRB(50, 51, 50, 0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DynamicTextFieldView()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    primary: Colors.deepPurple[300],
                  ),
                  child: const Text('Add Medicines',
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
                padding: const EdgeInsets.fromLTRB(30, 250, 30, 20),
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
