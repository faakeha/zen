import 'package:flutter/material.dart';
import 'package:zen/models/assessment_json.dart';
import 'package:zen/repositories/assessment_repo.dart';

class AssessmentProvider with ChangeNotifier {
  List<AssessmentJson> json_list = [];
  final AssessmentRepo _assessmentRepo = AssessmentRepo();


  Future<void> getProductsList() async {
    json_list = await _assessmentRepo.getList();
    notifyListeners();
  }

}