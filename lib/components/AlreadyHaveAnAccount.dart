import 'package:flutter/material.dart';
import 'package:zen/screens/constants.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  final bool login;
  final VoidCallback press;
  const AlreadyHaveAnAccount({
    super.key,
    this.login = true,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(login ? "Do you have an Account?" : "Already have an Account ? ",
            style: TextStyle(color: kPrimaryColor)),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? " Sign Up" : "Sign In",
            style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
