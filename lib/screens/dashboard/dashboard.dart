// import 'package:collection/collection.dart';
// import 'package:zen/models/assessment_json.dart';
// import 'package:zen/repositories/assessment_repo.dart';

// class DashBoard {
//   final double x;
//   final double y;
//   DashBoard({required this.x, required this.y});
// }

// AssessmentRepo repo = AssessmentRepo();
// Future<List<AssessmentJson>> x1 = repo.getList();

// List<DashBoard> get dashBoard {
//   List<int> symptoms_total = [];
//   AssessmentRepo repo = AssessmentRepo();
//   List<AssessmentJson> x1;
//   x1 = repo.getList() as List<AssessmentJson>;
//   for (var item in x1) {
//     symptoms_total.add(item.symptomsTotal);
//   }

//   for (var item in symptoms_total) {
//     print(item);
//   }

//   final data = <double>[2, 4, 6, 11, 3, 10, 15];
//   return data
//       .mapIndexed(
//           ((index, element) => DashBoard(x: index.toDouble(), y: element)))
//       .toList();
// }
