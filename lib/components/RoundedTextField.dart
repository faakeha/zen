import 'package:flutter/material.dart';
import 'package:zen/components/TextFieldWidget.dart';
import 'package:zen/screens/constants.dart';

class RoundedTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedTextField({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldWidget(
        child: TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none),
    ));
  }
}
