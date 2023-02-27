import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zen/models/user_json.dart';
import 'package:zen/repositories/user_repository.dart';
import 'package:zen/screens/constants.dart';

class CompleteProfileProvider with ChangeNotifier {
  final UserRepository _userRepository = UserRepository();

  bool _check = false;
  bool get check => _check;

  Future<void> completeProfile(UserJson newUser) async {
    await _userRepository.addUser(newUser);
    print('done');

    Fluttertoast.showToast(
        msg: 'Successfully signed up! Please login to continue',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        backgroundColor: SecondaryColor,
        textColor: Colors.black);
    // showSignedUpToast('Successfully signed up! Please login to continue');
  }

  Future<void> checkEmailVerified() async {
    FirebaseAuth fa = FirebaseAuth.instance;
    await fa.currentUser?.reload();
    if(!fa.currentUser!.emailVerified){
      _check = false;
      notifyListeners();
      // Future.doWhile(() async {
      //   await fa.currentUser?.reload();
      //   return fa.currentUser!.emailVerified;
      // });
    }
    else if(fa.currentUser!.emailVerified){
      _check = true;
      notifyListeners();
    }
  }
}