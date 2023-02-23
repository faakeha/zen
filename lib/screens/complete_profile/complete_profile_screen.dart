import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'components/body.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key, required this.user});

  final User? user;

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  @override
  Widget build(BuildContext context) {
    print("THIS IS UID" + widget.user!.uid);
    return Scaffold(
      body: Body(user: widget.user,),
    );
  }
}
