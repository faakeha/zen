import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:zen/models/assessment_json.dart';
import 'package:zen/models/user_json.dart';
import 'package:zen/repositories/assessment_repo.dart';
import 'package:zen/repositories/user_repository.dart';

class AssessmentProvider with ChangeNotifier {
  List<AssessmentJson> json_list = [];
  final AssessmentRepo _assessmentRepo = AssessmentRepo();
  final UserRepository _userRepository = UserRepository();

  UserJson _user = UserJson.empty();
  bool _change = false;

  UserJson get user => _user;
  bool get change => _change;

  Future<void> getUser() async {
    _user = await _userRepository.getUser();
    notifyListeners();
  }

  void setChange(){
    _change = true;
  }

  // Future<void> getProductsList() async {
  //   json_list = await _assessmentRepo.getList();
  //   for (var item in json_list) {
  //     print(item.symptomsTotal);
  //   }
  //   notifyListeners();
  // }

  Future<void> addAssessment(AssessmentJson assessment) async {
    print(user.id);
    List<AssessmentJson> assessments = [];
    if(user.assessments.isNotEmpty) {
      print('EMPTY LIST');
      for(var item in user.assessments){
        assessments.add(item);
      }
      assessments.add(assessment);
      print('ADDED TO LIST');
    }
    else {
      assessments.add(assessment);
      print('ADDED TO LIST');
    }
    UserJson updatedUser = user.copyWith(
      assessments: assessments
    );

    await _userRepository.updateUser(updatedUser);
  }


}
