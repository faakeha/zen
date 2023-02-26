import 'package:flutter/material.dart';
import 'package:zen/models/user_json.dart';
import 'package:zen/repositories/user_repository.dart';

class TodayProvider with ChangeNotifier {
  final UserRepository _userRepository = UserRepository();

  UserJson _user = UserJson.empty();

  UserJson get user => _user;

  Future<void> getUser() async {
    _user = await _userRepository.getUser();
    notifyListeners();
  }


}