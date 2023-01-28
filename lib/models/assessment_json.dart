class AssessmentJson {
  List<int> symptomsResponse = [];
  List<int> performanceResponse = [];
  int symptomsTotal = 0;
  double performanceAverage = 0.0;

  AssessmentJson(
      {required this.symptomsResponse,
      required this.performanceResponse,
      required this.symptomsTotal,
      required this.performanceAverage});

  Map<String, dynamic> toJson() => {
        "symptomsResponse": symptomsResponse,
        "performanceResponse": performanceResponse,
        "symptomsTotal": symptomsTotal,
        "performanceAverage": performanceAverage,
      };
}
