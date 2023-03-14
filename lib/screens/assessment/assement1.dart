import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zen/controllers/assessment_provider.dart';
import 'package:zen/models/assessment_json.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zen/screens/assessment/performance.dart';

import '../../controllers/assessment_provider.dart';
import '../../models/assessment_json.dart';
import '../../repositories/assessment_repo.dart';
import 'components/question_model.dart';

class Assessment extends StatefulWidget {
  const Assessment({Key? key}) : super(key: key);

  @override
  State<Assessment> createState() => _AssessmentState();
}

class _AssessmentState extends State<Assessment> {
  List<Question> questionList = getSymptomQuestions();
  int currentQuestionIndex = 0;
  double final_score = 0.0;
  List<int> scores = [];
  Answer? selectedAnswer;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
