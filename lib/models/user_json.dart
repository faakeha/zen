import 'package:zen/models/activity_json.dart';
import 'package:zen/models/appointment_json.dart';
import 'package:zen/models/assessment_json.dart';
import 'package:zen/models/medication_json.dart';

class UserJson {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  int? mobileNo;
  String? childName;
  int? childAge;
  String? childGender;
  List<String> favblog = [];
  List<MedicationJson> medications = [];
  List<AppointmentJson> appointments = [];
  List<AssessmentJson> assesments = [];
  List<ActivityJson> activities = [];

  UserJson(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.mobileNo,
      this.childName,
      this.childAge,
      this.childGender,
      required this.favblog,
      required this.appointments,
      required this.assesments,
      required this.activities});

  static UserJson fromJson(Map<String, dynamic> json, String id) => UserJson(
        id: id,
        firstName: json["firstName"] as String? ?? '',
        lastName: json["lastName"] as String? ?? '',
        email: json["email"] as String? ?? '',
        password: json["password"] as String? ?? '',
        mobileNo: json["mobileNo"] as int? ?? 0,
        childName: json["childName"] as String? ?? '',
        childAge: json["childAge"] as int? ?? 0,
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
        "password": password,
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
