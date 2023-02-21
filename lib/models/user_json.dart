import 'package:zen/models/activity_json.dart';
import 'package:zen/models/appointment_json.dart';
import 'package:zen/models/assessment_json.dart';
import 'package:zen/models/medication_json.dart';

class UserJson {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? mobileNo;
  String? childName;
  String? childAge;
  String? childGender;
  List<String>? favblog = [];
  List<MedicationJson>? medications = [];
  List<AppointmentJson>? appointments = [];
  List<AssessmentJson>? assesments = [];
  List<ActivityJson>? activities = [];

  UserJson(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.mobileNo,
      required this.childName,
      required this.childAge,
      required this.childGender,
      this.favblog,
      this.appointments,
      this.assesments,
      this.activities});

  static UserJson fromJson(Map<String, dynamic> json, String id) => UserJson(
        id: id,
        firstName: json["firstName"] as String? ?? '',
        lastName: json["lastName"] as String? ?? '',
        email: json["email"] as String? ?? '',
        mobileNo: json["mobileNo"] as String? ?? '',
        childName: json["childName"] as String? ?? '',
        childAge: json["childAge"] as String? ?? '',
        childGender: json["childGender"] as String? ?? '',
        favblog: List<String>.from(json["favblog"].map((x) => x)),
        appointments:
            List<AppointmentJson>.from(json["appointments"].map((x) => x)),
        assesments: List<AssessmentJson>.from(json["assesments"].map((x) => x)),
        activities: List<ActivityJson>.from(json["activities"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "mobileNo": mobileNo,
        "childName": childName,
        "childAge": childAge,
        "childGender": childGender,
        "favblog": favblog,
        "appointments": appointments,
        "assesments": assesments,
        "activities": activities
      };
}
