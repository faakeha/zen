import 'package:flutter/material.dart';
import 'package:zen/components/TextFieldWidget.dart';
import 'package:zen/screens/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldWidget(
        child: TextField(
      obscureText: true,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: "Password",
        icon: const Icon(
          Icons.lock,
          color: kPrimaryColor,
        ),
        suffixIcon: Icon(
          Icons.visibility,
          color: kPrimaryColor,
        ),
        border: InputBorder.none,
      ),
    ));
  }
}
