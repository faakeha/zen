import 'package:flutter/material.dart';
import 'package:zen/screens/constants.dart';

class AppointmentWidget extends StatefulWidget {
  const AppointmentWidget({Key? key}) : super(key: key);

  @override
  State<AppointmentWidget> createState() => _AppointmentWidgetState();
}

class _AppointmentWidgetState extends State<AppointmentWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
          children: [
            Text("add"),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
                      tileColor: SecondaryColor,
                      leading: Icon(Icons.schedule, size: 30.0,),
                      title: Text("Title"),
                      subtitle: Text("Date"),
                      trailing: Text("Time"),
                    ),
                  )
                  ],
              ),
            ),
          ],
        ));
  }
}
