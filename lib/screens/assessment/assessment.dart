import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zen/controllers/assessment_provider.dart';
import 'package:zen/models/assessment_json.dart';
import 'package:provider/provider.dart';

import 'components/question_model.dart';

class Assessment extends StatefulWidget {
  const Assessment({Key? key}) : super(key: key);

  @override
  State<Assessment> createState() => _AssessmentState();
}

class _AssessmentState extends State<Assessment> {
  List<Question> questionList = getSymptomQuestions();
  int currentQuestionIndex = 0;
  int final_score = 0;
  List<int> scores = [];
  //Future<List<AssessmentJson>> json_list = [] as Future<List<AssessmentJson>>;
  Answer? selectedAnswer;
  final List<Answer> answerListSymptoms = [
    Answer("Never", 0),
    Answer("Occasionally", 1),
    Answer("Often", 2),
    Answer("Very Often", 3),
  ];

  @override
  void initState() {
    // TODO: implement initState
    context.watch<AssessmentProvider>().getProductsList();
  }

  @override
  Widget build(BuildContext context) {
    List<AssessmentJson> list = context.watch<AssessmentProvider>().json_list;

    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          const Text(
            "Simple Quiz App",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          _questionWidget(),
          _answerList(),
          _nextButton(),
        ]),
      ),
    );
  }

  _questionWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Question ${currentQuestionIndex + 1}/${questionList.length.toString()}",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 20),
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.orangeAccent,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            questionList[currentQuestionIndex].questionText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }

  _answerList() {
    return Column(
      children: questionList[currentQuestionIndex]
          .answersList
          .map(
            (e) => _answerButton(e),
          )
          .toList(),
    );
  }

  Widget _answerButton(Answer answer) {
    bool isSelected = answer == selectedAnswer;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 48,
      child: ElevatedButton(
        child: Text(answer.answerText),
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          primary: isSelected ? Colors.orangeAccent : Colors.white,
          onPrimary: isSelected ? Colors.white : Colors.black,
        ),
        onPressed: () {
          if (selectedAnswer == null) {
            final_score += answer.score;
            scores.add(answer.score);
            //score++;
            setState(() {
              selectedAnswer = answer;
            });
          }
        },
      ),
    );
  }

  void _saveScores() {
    final scoresList = scores;
    AssessmentJson aj = AssessmentJson(
        symptomsResponse: scores,
        performanceResponse: [],
        symptomsTotal: final_score,
        performanceAverage: 0);
    FirebaseFirestore.instance.collection("Assessment").add(aj.toJson());
  }

  _nextButton() {
    bool isLastQuestion = false;
    if (currentQuestionIndex == questionList.length - 1) {
      isLastQuestion = true;
    }

    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: 48,
      child: ElevatedButton(
        child: Text(isLastQuestion ? "Submit" : "Next"),
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          primary: Colors.blueAccent,
          onPrimary: Colors.white,
        ),
        onPressed: () {
          if (isLastQuestion) {
            //display score
            print(final_score);
            _saveScores();
            // showDialog(context: context, builder: (_) => _showScoreDialog());
          } else {
            //scores.add(selectedAnswer!.score);
            //next question
            setState(() {
              selectedAnswer = null;
              currentQuestionIndex++;
            });
          }
        },
      ),
    );
  }

/*_showScoreDialog() {
  bool isPassed = false;

  if (score >= questionList.length * 0.6) {
    //pass if 60 %
    isPassed = true;
  }
  String title = isPassed ? "Passed " : "Failed";

  return AlertDialog(
    title: Text(
      title + " | Score is $score",
      style: TextStyle(color: isPassed ? Colors.green : Colors.redAccent),
    ),
    content: ElevatedButton(
      child: const Text("Restart"),
      onPressed: () {
        Navigator.pop(context);
        setState(() {
          currentQuestionIndex = 0;
          score = 0;
          selectedAnswer = null;
        });
      },
    ),
  );
}
*/
}
