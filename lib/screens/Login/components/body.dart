import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zen/components/AlreadyHaveAnAccount.dart';
import 'package:zen/components/RoundedButton.dart';
import 'package:zen/components/TextFieldWidget.dart';
import 'package:zen/controllers/login_provider.dart';
//import 'package:zen/components/RoundedInputField.dart';
//import 'package:zen/components/RoundedPasswordField.dart';
import 'package:zen/screens/Login/components/background.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zen/screens/constants.dart';
import 'package:zen/screens/signup/signu_up_screen.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

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
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            RoundedTextField(
                hintText: "Your Email",
                onChanged: (value) {
                  print(value);
                  email = value;
                }),
            RoundedPasswordField(
              onChanged: (value) {
                print(value);
                password = value;
              },
            ),
            RoundedButton(
                text: "LOGIN",
                press: () async {
                  user = await context
                      .read<LoginProvider>()
                      .login(email!, password!);
                }),
            SizedBox(
              height: size.height * 0.03,
            ),
            AlreadyHaveAnAccount(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            )
          ]),
    );
  }
}

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

class TextFieldWidget extends StatelessWidget {
  final Widget child;

  const TextFieldWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}

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
