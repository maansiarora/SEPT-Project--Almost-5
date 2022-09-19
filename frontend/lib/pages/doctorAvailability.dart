// importing packages and required pages and libraries
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'doctorAvailabilitySave.dart';
import 'doctorDashboard.dart';

// this page is for the doctor to fill in their availability so that it is reflected accordingly to the patient while they are booking
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: doctorAvail(),
    );
  }
}

class doctorAvail extends StatefulWidget {
  const doctorAvail({
    Key? key,
  }) : super(key: key);

  @override
  State<doctorAvail> createState() => _doctorAvailState();
}

class _doctorAvailState extends State<doctorAvail> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  TimeOfDay selectedTime2 = TimeOfDay.now();
  DateTime dateTime = DateTime.now();
  bool showDate = false;
  bool showTime = false;
  bool showDateTime = false;

  // selection for the date - date picker
  Future<DateTime> _selectDate(BuildContext context) async {
    final selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.deepPurpleAccent,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: Colors.deepPurpleAccent,
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
      });
    }
    return selectedDate;
  }

// selection for the start time - time picker
  Future<TimeOfDay> _selectTime(BuildContext context) async {
    final selected = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.deepPurpleAccent,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: Colors.deepPurpleAccent, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (selected != null && selected != selectedTime) {
      setState(() {
        selectedTime = selected;
      });
    }
    return selectedTime;
  }

  // selection for end time - time picker
  Future<TimeOfDay> _selectTime2(BuildContext context) async {
    final selected = await showTimePicker(
      context: context,
      initialTime: selectedTime2,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.deepPurpleAccent,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: Colors.deepPurpleAccent, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (selected != null && selected != selectedTime2) {
      setState(() {
        selectedTime2 = selected;
      });
    }
    return selectedTime2;
  }

  String getDate() {
    // ignore: unnecessary_null_comparison
    if (selectedDate == null) {
      return 'select date';
    } else {
      return DateFormat('MMM d, yyyy').format(selectedDate);
    }
  }

  String getDateTime() {
    // ignore: unnecessary_null_comparison
    if (dateTime == null) {
      return 'select date timer';
    } else {
      return DateFormat('yyyy-MM-dd HH: ss a').format(dateTime);
    }
  }

  String getTime(TimeOfDay tod) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat.jm();
    return format.format(dt);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // adding the app bar with back icon to go to the previous page
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => doctorDashboard()),
            );
          },
          child: const Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),

      // adding scrollbar
      body: Scrollbar(
          child: Center(
        child: Form(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: const Text(
                  'Set Availabilities',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                )),
            Container(
              padding: const EdgeInsets.fromLTRB(70, 50, 70, 3),
              width: double.infinity,
              // allowing the user to choose the date and displaying the chosen date
              child: ElevatedButton(
                onPressed: () {
                  _selectDate(context);
                  showDate = true;
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  primary: Colors.deepPurple[300],
                ),
                child: const Text('Select Date',
                    style: TextStyle(
                      fontSize: 17,
                    )),
              ),
            ),
            showDate
                ? Center(
                    child: Text(getDate(),
                        style: const TextStyle(
                          fontSize: 16,
                        )))
                : const SizedBox(),
            Container(
              padding: const EdgeInsets.fromLTRB(70, 20, 70, 3),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _selectTime(context);
                  showTime = true;
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  primary: Colors.deepPurple[300],
                ),
                child: const Text('Start Time',
                    style: TextStyle(
                      fontSize: 17,
                    )),
              ),
            ),
            // allowing the user to choose the time and displaying the chosen time
            showTime
                ? Center(
                    child: Text(getTime(selectedTime),
                        style: const TextStyle(
                          fontSize: 16,
                        )))
                : const SizedBox(),
            Container(
              padding: const EdgeInsets.fromLTRB(70, 20, 70, 3),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _selectTime2(context);
                  showTime = true;
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  primary: Colors.deepPurple[300],
                ),
                child: const Text('End Time',
                    style: TextStyle(
                      fontSize: 17,
                    )),
              ),
            ),
            // allowing the user to choose the time and displaying the chosen time
            showTime
                ? Center(
                    child: Text(getTime(selectedTime2),
                        style: const TextStyle(
                          fontSize: 16,
                        )))
                : const SizedBox(),
            Container(
                //height: 70,
                padding: const EdgeInsets.fromLTRB(260, 50, 30, 0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const doctorAvailabilitySave()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    primary: Colors.deepPurple[300],
                  ),
                  child: const Text('Save',
                      style: TextStyle(
                        fontSize: 19,
                      )),
                )),
          ],
        )),
      )),
    );
  }
}
