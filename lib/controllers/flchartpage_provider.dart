import 'package:flutter/material.dart';
import 'package:zen/models/assessment_json.dart';
import 'package:zen/models/user_json.dart';
import 'package:zen/repositories/assessment_repo.dart';
import 'package:zen/repositories/user_repository.dart';

class FlChartPageProvider with ChangeNotifier {
  AssessmentRepo repo = AssessmentRepo();
  final UserRepository _userRepository = UserRepository();

  UserJson _user = UserJson.empty();

  UserJson get user => _user;

  List<double> _scoreTotals = [];

  List<double> get scoreTotals => _scoreTotals;

  List<double> _scoreAvg = [];

  List<double> get scoreAvg => _scoreAvg;

  Future<void> getUser() async {
    _user = await _userRepository.getUser();
    notifyListeners();
  }

  Future<void> scoreTotal() async {
    List<double> symptoms_total = [];

    List<AssessmentJson> x1;
    x1 = _user.assessments;
    print('${_user.assessments.length} LENGTH OF ASSESSMENTS');
    if (x1.isNotEmpty) {
      for (var item in x1) {
        print(item.symptomsTotal.toString());
        symptoms_total.add(item.symptomsTotal);
      }
      _scoreTotals = symptoms_total;
      notifyListeners();
    }
  }

  Future<void> PerformanceAvg() async {
    List<double> performance_avg = [];

    List<AssessmentJson> x1;
    x1 = _user.assessments;
    print('${_user.assessments.length} LENGTH OF ASSESSMENTS');
    if (x1.isNotEmpty) {
      for (var item in x1) {
        print(item.performanceAverage.toString());
        performance_avg.add(item.performanceAverage);
      }
      _scoreAvg = performance_avg;
      notifyListeners();
    }
  }
}
