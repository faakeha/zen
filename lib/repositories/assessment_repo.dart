import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/assessment_json.dart';

class AssessmentRepo {
  final db = FirebaseFirestore.instance;

  Future<List<AssessmentJson>> getList() async {
    List<AssessmentJson> list = [];
    await FirebaseFirestore.instance
        .collection("Assessment")
        .get()
        .then((event) {
      list = event.docs.map((e) => AssessmentJson.fromJson(e.data())).toList();
    }).catchError((error) => print("Failed to fetch list. Error : ${error}"));
    return list;
  }

}