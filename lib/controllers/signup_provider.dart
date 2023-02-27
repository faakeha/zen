import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zen/models/user_json.dart';
import 'package:zen/repositories/user_repository.dart';

class SignUpProvider with ChangeNotifier {
  final UserRepository _signuprepo = UserRepository();
  //late User _user;

  late Timer backgroundFunction; // the Timer which will keep running until some cond is meet.

  bool _done = false;

  bool get done => _done;

  Future<User?> signup(String email, String password) async {
    dynamic result = await _signuprepo.signUp(email, password);
    print("EM" + email);
    print("Pass" + password);

    if (result is User) {
      // _user = result;
      result.sendEmailVerification();
      // Timer timer = Timer.periodic(Duration(seconds: 20), (timer) async {
      //   print('20 secs done');
      //   await result.reload();
      //   print(result.emailVerified.toString()+'CHECK EMAIL VERIFIED');
      // });
      // print('STATUS'+result.emailVerified.toString());
      // // await result.reload();
      // await Future.doWhile(() async => await getEmailVerified(result));
      // print('STATUS'+result.emailVerified.toString());
      // getEmailVerified(result);
      // await _waitUntilDone();
      // if(result.emailVerified){
      return result;

      // }

    }
    else if (result is FirebaseAuthException) {
      print(result);
    }
    return null;
  }

  Future<bool> getEmailVerified(User _user) async {
    await _user.reload();
    return !_user.emailVerified;
  }

}
