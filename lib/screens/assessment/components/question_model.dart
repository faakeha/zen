class Question {
  final String questionText;

  Question(this.questionText);
}

class Answer {
  final String answerText;
  final int score;

  Answer(this.answerText, this.score);
}

List<Question> getSymptomQuestions() {
  List<Question> list = [
    Question("1. Does not pay attention to details or makes careless mistakes with, for example, homework",),
    Question("2. Has difficulty keeping attention to what needs to be done",),
    Question("3. Does not seem to listen when spoken to directly",),
    Question("4. Does not follow through when given directions and fails to finish activities (not due to refusal or failure to understand)",),
    Question("5. Has difficulty organizing tasks and activities",),
    Question("6. Avoids, dislikes, or does not want to start tasks that require ongoing mental effort",),
    Question("7. Loses things necessary for tasks or activities (toys, assignments, pencils or books)",),
    Question("8. Is easily distracted by noises or other stimuli",),
    Question("9. Is forgetful in daily activities",),
    Question("10. Fidgets with hands or feet or squirms in seat",),
    Question("11. Leaves seat when remaining seated is expected",),
    Question("12. Runs about or climbs too much when remaining seated is expected",),
    Question("13. Has difficulty playing or beginning quiet play activities",),
    Question("14. Is “on the go” or often acts as if “driven by a motor”",),
    Question("15. Talks too much",),
    Question("16. Blurts out answers before questions have been completed",),
    Question("17. Has difficulty waiting his or her turn",),
    Question("18. Interrupts or intrudes in on others’ conversations and/or activities",),
  ];

  return list;
}
List<Question> getPerformanceQuestions() {
  List<Question> list = [
    Question("1. Overall school performance",),
    Question("2. Reading",),
    Question("3. Writing",),
    Question("4. Mathematics",),
    Question("5. Relationship with Parents",),
    Question("6. Relationship with Siblings",),
    Question("7. Relationship with Peers",),
    Question("8. Participation in organized activities (eg, teams)",),

  ];
  return list;

}
/* [
      Answer("Never", 0),
      Answer("Occasionally", 1),
      Answer("Often", 2),
      Answer("Very Often", 3),
    ],*/