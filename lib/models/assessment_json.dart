import 'package:cloud_firestore/cloud_firestore.dart';

class AssessmentJson {
  List<int> symptomsResponse = [];
  List<int> performanceResponse = [];
  double symptomsTotal = 0.0;
  double performanceAverage = 0.0;
  DateTime date = DateTime.now();

  AssessmentJson(
      {required this.symptomsResponse,
      required this.performanceResponse,
      required this.symptomsTotal,
      required this.performanceAverage,
      required this.date});

  Map<String, dynamic> toJson() => {
        "symptomsResponse": symptomsResponse,
        "performanceResponse": performanceResponse,
        "symptomsTotal": symptomsTotal,
        "performanceAverage": performanceAverage,
        "date": date,
      };
  static AssessmentJson fromJson(Map<String, dynamic> json) => AssessmentJson(
        symptomsResponse:
            List<int>.from(json["symptomsResponse"].map((x) => x)),
        performanceResponse:
            List<int>.from(json["performanceResponse"].map((x) => x)),
        symptomsTotal: json["symptomsTotal"].toDouble(),
        performanceAverage: json["performanceAverage"],
        date: (json["date"] as Timestamp).toDate(),
      );
}
