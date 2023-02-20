import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zen/controllers/check_in_provider.dart';
import 'package:zen/screens/check_in/components/appointment_widget.dart';
import 'package:zen/screens/check_in/components/categories_header.dart';
import 'package:zen/screens/check_in/components/medication_widget.dart';

class CheckIn extends StatefulWidget {
  const CheckIn({Key? key}) : super(key: key);

  @override
  State<CheckIn> createState() => _CheckInState();
}

class _CheckInState extends State<CheckIn> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = context.watch<CheckInProvider>().selectedIndex;

    return Scaffold(
        appBar: AppBar(
          title: Text("Check-In"),
        ),
        body: Column(
          children: [
            CategoriesHeader(),
            Visibility(
                visible: selectedIndex == 0 ? true : false,
                child: MedicationWidget()
            ),
            Visibility(
                visible: selectedIndex == 1 ? true : false,
                child: AppointmentWidget()
            ),
            Visibility(
                visible: selectedIndex == 2 ? true : false,
                child: Expanded(
                    child: ListView(
                      children: const [
                        Text('name3'), Text('time3'), Text('day3')],
                    ))),
          ],
        ));
  }
}
