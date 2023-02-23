import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zen/models/user_json.dart';
import 'package:zen/repositories/user_repository.dart';

class SignUpProvider with ChangeNotifier {
  final UserRepository _signuprepo = UserRepository();

  Future<User?> signup(String email, String password) async {
    dynamic result = await _signuprepo.signUp(email, password);
    print("EM" + email);
    print("Pass" + password);

    if (result is User) {
      return result;
    }
    else if (result is FirebaseAuthException) {
      print(result);
    }
    return null;
  }
}
