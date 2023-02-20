import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zen/models/user_json.dart';
import 'package:zen/repositories/user_repository.dart';

class LoginProvider with ChangeNotifier {
  final UserRepository _loginrepo = UserRepository();
}
