class Question {
  final String questionText;
  final List<Answer> answersList;

  Question(this.questionText, this.answersList);
}

class Answer {
  String answerText = "";
  int score = 0;
  int answer = 0;

  Answer(this.answerText, this.score);
  Answer._(this.answer, this.score);
}

List<Question> getSymptomQuestions() {
  List<Question> list = [
    Question(
      "1. Does not pay attention to details or makes careless mistakes with, for example, homework",
      [
        Answer("Never", 0),
        Answer("Occasionally", 1),
        Answer("Often", 2),
        Answer("Very Often", 3),
      ],
    ),
    Question(
      "2. Has difficulty keeping attention to what needs to be done",
      [
        Answer("Never", 0),
        Answer("Occasionally", 1),
        Answer("Often", 2),
        Answer("Very Often", 3),
      ],
    ),
    Question(
      "3. Does not seem to listen when spoken to directly",
      [
        Answer("Never", 0),
        Answer("Occasionally", 1),
        Answer("Often", 2),
        Answer("Very Often", 3),
      ],
    ),
    Question(
      "4. Does not follow through when given directions and fails to finish activities (not due to refusal or failure to understand)",
      [
        Answer("Never", 0),
        Answer("Occasionally", 1),
        Answer("Often", 2),
        Answer("Very Often", 3),
      ],
    ),
    Question(
      "5. Has difficulty organizing tasks and activities",
      [
        Answer("Never", 0),
        Answer("Occasionally", 1),
        Answer("Often", 2),
        Answer("Very Often", 3),
      ],
    ),
    Question(
      "6. Avoids, dislikes, or does not want to start tasks that require ongoing mental effort",
      [
        Answer("Never", 0),
        Answer("Occasionally", 1),
        Answer("Often", 2),
        Answer("Very Often", 3),
      ],
    ),
    Question(
      "7. Loses things necessary for tasks or activities (toys, assignments, pencils or books)",
      [
        Answer("Never", 0),
        Answer("Occasionally", 1),
        Answer("Often", 2),
        Answer("Very Often", 3),
      ],
    ),
    Question(
      "8. Is easily distracted by noises or other stimuli",
      [
        Answer("Never", 0),
        Answer("Occasionally", 1),
        Answer("Often", 2),
        Answer("Very Often", 3),
      ],
    ),
    Question(
      "9. Is forgetful in daily activities",
      [
        Answer("Never", 0),
        Answer("Occasionally", 1),
        Answer("Often", 2),
        Answer("Very Often", 3),
      ],
    ),
    Question(
      "10. Fidgets with hands or feet or squirms in seat",
      [
        Answer("Never", 0),
        Answer("Occasionally", 1),
        Answer("Often", 2),
        Answer("Very Often", 3),
      ],
    ),
    Question(
      "11. Leaves seat when remaining seated is expected",
      [
        Answer("Never", 0),
        Answer("Occasionally", 1),
        Answer("Often", 2),
        Answer("Very Often", 3),
      ],
    ),
    Question(
      "12. Runs about or climbs too much when remaining seated is expected",
      [
        Answer("Never", 0),
        Answer("Occasionally", 1),
        Answer("Often", 2),
        Answer("Very Often", 3),
      ],
    ),
    Question(
      "13. Has difficulty playing or beginning quiet play activities",
      [
        Answer("Never", 0),
        Answer("Occasionally", 1),
        Answer("Often", 2),
        Answer("Very Often", 3),
      ],
    ),
    Question(
      "14. Is “on the go” or often acts as if “driven by a motor”",
      [
        Answer("Never", 0),
        Answer("Occasionally", 1),
        Answer("Often", 2),
        Answer("Very Often", 3),
      ],
    ),
    Question(
      "15. Talks too much",
      [
        Answer("Never", 0),
        Answer("Occasionally", 1),
        Answer("Often", 2),
        Answer("Very Often", 3),
      ],
    ),
    Question(
      "16. Blurts out answers before questions have been completed",
      [
        Answer("Never", 0),
        Answer("Occasionally", 1),
        Answer("Often", 2),
        Answer("Very Often", 3),
      ],
    ),
    Question(
      "17. Has difficulty waiting his or her turn",
      [
        Answer("Never", 0),
        Answer("Occasionally", 1),
        Answer("Often", 2),
        Answer("Very Often", 3),
      ],
    ),
    Question(
      "18. Interrupts or intrudes in on others’ conversations and/or activities",
      [
        Answer("Never", 0),
        Answer("Occasionally", 1),
        Answer("Often", 2),
        Answer("Very Often", 3),
      ],
    ),
  ];

  return list;
}

List<Question> getPerformanceQuestions() {
  List<Question> list = [
    Question("1. Overall school performance", [
      Answer._(1, 1),
      Answer._(2, 2),
      Answer._(3, 3),
      Answer._(4, 4),
    ]),
    Question("2. Reading", [
      Answer._(1, 1),
      Answer._(2, 2),
      Answer._(3, 3),
      Answer._(4, 4),
    ]),
    Question("3. Writing", [
      Answer._(1, 1),
      Answer._(2, 2),
      Answer._(3, 3),
      Answer._(4, 4),
    ]),
    Question("4. Mathematics", [
      Answer._(1, 1),
      Answer._(2, 2),
      Answer._(3, 3),
      Answer._(4, 4),
    ]),
    Question("5. Relationship with Parents", [
      Answer._(1, 1),
      Answer._(2, 2),
      Answer._(3, 3),
      Answer._(4, 4),
    ]),
    Question("6. Relationship with Siblings", [
      Answer._(1, 1),
      Answer._(2, 2),
      Answer._(3, 3),
      Answer._(4, 4),
    ]),
    Question("7. Relationship with Peers", [
      Answer._(1, 1),
      Answer._(2, 2),
      Answer._(3, 3),
      Answer._(4, 4),
    ]),
    Question("8. Participation in organized activities (eg, teams)", [
      Answer._(1, 1),
      Answer._(2, 2),
      Answer._(3, 3),
      Answer._(4, 4),
    ]),
  ];
  return list;
}
/* [
      Answer("Never", 0),
      Answer("Occasionally", 1),
      Answer("Often", 2),
      Answer("Very Often", 3),
    ],*/