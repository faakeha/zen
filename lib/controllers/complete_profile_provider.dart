import 'package:flutter/material.dart';
import 'package:zen/models/user_json.dart';
import 'package:zen/repositories/user_repository.dart';

class CompleteProfileProvider with ChangeNotifier {
  final UserRepository _userRepository = UserRepository();

  Future<void> completeProfile(UserJson newUser) async {
    await _userRepository.addUser(newUser);
    print('done');
  }
}