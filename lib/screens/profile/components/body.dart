import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zen/components/AlreadyHaveAnAccount.dart';
import 'package:zen/components/RoundedButton.dart';
import 'package:zen/components/RoundedPasswordField.dart';
import 'package:zen/components/RoundedTextField.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zen/screens/profile/components/background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        RoundedTextField(hintText: "First Name", onChanged: (value) {}),
        RoundedTextField(hintText: "Last Name", onChanged: (value) {}),
        RoundedTextField(hintText: "Mobile No.", onChanged: (value) {}),
        RoundedTextField(hintText: "Child Name", onChanged: (value) {}),
        RoundedTextField(hintText: "Child Age", onChanged: (value) {}),
        RoundedButton(text: "SUBMIT", press: () {}),
        SizedBox(
          height: size.height * 0.03,
        ),
      ],
    ));
  }
}
