import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(calender()));
}

class calender extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TableBasicsExample(),
    );
  }
}

class TableBasicsExample extends StatefulWidget {
  @override
  _TableBasicsExampleState createState() => _TableBasicsExampleState();
}

class _TableBasicsExampleState extends State {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  List<String> appointment = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
          const Padding(
            padding: EdgeInsets.fromLTRB(30, 70, 30, 5),
          ),
          const Center(
              child: Text(
            'Doctor Name',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          )),
          /*const Center(
              child: Text(
            'Availability',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300,
            ),
          )),*/
          const Padding(
              padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
              child: Divider(
                color: Colors.grey,
              )),
          Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: TableCalendar(
                firstDay: DateTime.utc(2010, 10, 20),
                lastDay: DateTime.utc(2040, 10, 20),
                focusedDay: _focusedDay,
                calendarFormat: _calendarFormat,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  if (!isSameDay(_selectedDay, selectedDay)) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                      func(_selectedDay);
                    });
                  }
                },
                onFormatChanged: (format) {
                  if (_calendarFormat != format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  }
                },
                onPageChanged: (focusedDay) {
                  _focusedDay = focusedDay;
                },
              )),
          Container(
            height: 200,
            alignment: Alignment.center,
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: ListView.builder(
              itemCount: appointment.length,
              itemBuilder: (context, index) {
                return ListTile(
                  shape: const Border(
                    bottom: BorderSide(width: 2.0, color: Colors.purple),
                  ),
                  title: Text('${appointment[index]}'),
                );
              },
            ),
          )
        ])));
  }

  void func(day) {
    List<String> avail = ['9:00-9:30', '10:00-10:30', '16:00-16:30'];
    setState(() => appointment = avail);
  }
}
