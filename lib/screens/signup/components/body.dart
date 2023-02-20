import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zen/components/AlreadyHaveAnAccount.dart';
import 'package:zen/components/RoundedButton.dart';
import 'package:zen/components/RoundedPasswordField.dart';
import 'package:zen/components/RoundedTextField.dart';
import 'package:zen/controllers/Signup_provider.dart';
import 'package:zen/screens/Login/login_screen.dart';
import 'package:zen/screens/profile/profile_screen.dart';
import 'package:zen/screens/signup/components/background.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zen/components/AlreadyHaveAnAccount.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String? email;
    String? password;
    User? user;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "SIGN UP",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          SvgPicture.asset(
            "assets/icons/signup.svg",
            height: size.height * 0.35,
          ),
          RoundedTextField(
              hintText: "Your Email",
              onChanged: (value) {
                email = value;
              }),
          RoundedPasswordField(onChanged: (value) {
            password = value;
          }),
          RoundedButton(
              text: "SIGN UP",
              press: () {
                user = context.read<SignUpProvider>().Signup(email!, password!);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ProfileScreen(
                        user: user,
                      );
                    },
                  ),
                );
              }),
          SizedBox(
            height: size.height * 0.03,
          ),
          AlreadyHaveAnAccount(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class OrDivider {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      child: Row(children: <Widget>[
        Expanded(
          child: Divider(),
        )
      ]),
    );
  }
}
