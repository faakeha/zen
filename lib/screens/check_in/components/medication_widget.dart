import 'package:flutter/material.dart';

class MedicationWidget extends StatefulWidget {
  const MedicationWidget({Key? key}) : super(key: key);

  @override
  State<MedicationWidget> createState() => _MedicationWidgetState();
}

class _MedicationWidgetState extends State<MedicationWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(
      children: const [
        ListTile(
          title: Text("Name"),
          subtitle: Text("Date Time"),
        ),
      ],
    ));
  }
}
