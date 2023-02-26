import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zen/controllers/signup_provider.dart';
import 'components/body.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key, required this.user});

  final User? user;

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async =>
    {
       // context.watch<SignUpProvider>().done,
    });}

  @override
  Widget build(BuildContext context) {
    print("THIS IS UID" + widget.user!.uid);
    return Scaffold(
      body: Body(user: widget.user,),
    );
  }
}

