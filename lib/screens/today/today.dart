import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:zen/controllers/today_provider.dart';
import 'package:zen/screens/assessment/assessment.dart';
import 'package:zen/screens/constants.dart';
import 'package:zen/screens/dashboard/dashboard.dart';
import 'package:zen/screens/dashboard/linechart.dart';

class Today extends StatefulWidget {
  const Today({Key? key}) : super(key: key);

  @override
  State<Today> createState() => _TodayState();
}

class _TodayState extends State<Today> {
  CalendarFormat _calendarFormat = CalendarFormat.week;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async =>
    {
      await context.read<TodayProvider>().getUser(),
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Text(context.watch<TodayProvider>().user.firstName),
        TableCalendar(
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: DateTime.now(),
          calendarFormat: _calendarFormat,
          onFormatChanged: (format) {
            setState(() {
              _calendarFormat = format;
            });
          },
          calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                  color: primaryColorPeach,
                  borderRadius: BorderRadius.circular(30))),
        ),
        SizedBox(),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Assessment()));
            },
            child: Text('Log symptoms')),
        FlChartPage(),
      ]),
    );
  }
}
