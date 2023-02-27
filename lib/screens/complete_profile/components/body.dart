import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zen/components/AlreadyHaveAnAccount.dart';
import 'package:zen/components/RoundedButton.dart';
import 'package:zen/components/RoundedPasswordField.dart';
import 'package:zen/components/RoundedTextField.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zen/controllers/complete_profile_provider.dart';
import 'package:zen/models/user_json.dart';
import 'package:zen/screens/today/today.dart';

class Body extends StatefulWidget {
  const Body({super.key, required this.user});

  final User? user;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String firstName = '',
        lastName = '',
        mobileNo = '',
        childName = '',
        childAge = '',
        childGender = '';

    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        RoundedTextField(
            hintText: "First Name",
            onChanged: (value) {
              firstName = value;
            }),
        RoundedTextField(
            hintText: "Last Name",
            onChanged: (value) {
              lastName = value;
            }),
        RoundedTextField(
            hintText: "Mobile No.",
            onChanged: (value) {
              mobileNo = value;
            }),
        RoundedTextField(
            hintText: "Child Name",
            onChanged: (value) {
              childName = value;
            }),
        RoundedTextField(
            hintText: "Child Age",
            onChanged: (value) {
              childAge = value;
            }),
        RoundedTextField(
            hintText: "Child Gender",
            onChanged: (value) {
              childGender = value;
            }),
        RoundedButton(
            text: "SUBMIT",
            press: () async {
              UserJson newUser = UserJson(
                id: widget.user?.uid,
                firstName: firstName,
                lastName: lastName,
                email: widget.user?.email,
                mobileNo: mobileNo,
                childName: childName,
                childAge: childAge,
                childGender: childGender,
                favouriteBlogs: [],
                medications: [],
                appointments: [],
                assessments: [],
                activities: [],
              );

              context.read<CompleteProfileProvider>().checkEmailVerified();
              bool check = context.read<CompleteProfileProvider>().check;
              if(check == false){
                print('CHECK IS FALSE');
                showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Text("Please verify your email and try again."),
                    actions: [
                      SizedBox(
                        height: 60,
                        width: 100,
                        child: ElevatedButton(
                          onPressed: () async =>
                          {
                            //await context.read<MyProfileProvider>().cancelSubscription(),
                            // context.read<MyProfileProvider>().logout(),
                            Navigator.pop(context),
                            // context.read<NavBar>().setPage('home'),
                          },
                          child: Text('Ok'),
                        ),
                      ),
                    ],
                  );
                });

                 check = context.read<CompleteProfileProvider>().check;
              }
              if(check) {
                await context
                    .read<CompleteProfileProvider>()
                    .completeProfile(newUser);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Today();
                    },
                  ),
                );
              }
            }),
        SizedBox(
          height: size.height * 0.03,
        ),
      ],
    ));
  }
}
