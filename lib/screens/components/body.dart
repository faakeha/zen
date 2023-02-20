import 'package:flutter/material.dart';
import 'package:zen/components/RoundedButton.dart';
import 'package:zen/screens/Login/login_screen.dart';
import 'package:zen/screens/components/background.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zen/screens/constants.dart';
import 'package:lottie/lottie.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "WELCOME TO ZEN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            //SvgPicture.asset(
            //"assets/icons/chat.svg",
            //height: size.height * 0.45,
            //),
            Lottie.network(
                "https://assets5.lottiefiles.com/private_files/lf30_of3skn6w.json"),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "LOGIN",
              color: Color(0xFFF414FF0),
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
            RoundedButton(
              text: "SIGN UP",
              color: Color.fromARGB(255, 187, 213, 246),
              textColor: Colors.black,
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}
