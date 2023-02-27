import 'package:zen/models/activity_json.dart';
import 'package:zen/models/appointment_json.dart';
import 'package:zen/models/assessment_json.dart';
import 'package:zen/models/medication_json.dart';

class UserJson {
  String? id;
  String firstName;
  String lastName;
  String? email;
  String mobileNo;
  String childName;
  String childAge;
  String childGender;
  List<String> favouriteBlogs = [];
  List<MedicationJson> medications = [];
  List<AppointmentJson> appointments = [];
  List<AssessmentJson> assessments = [];
  List<ActivityJson> activities = [];

  UserJson(
      {this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.mobileNo,
      required this.childName,
      required this.childAge,
      required this.childGender,
      required this.favouriteBlogs,
      required this.medications,
      required this.appointments,
      required this.assessments,
      required this.activities});

  UserJson.empty()
      : firstName = '',
        lastName = '',
        email = '',
        mobileNo = '',
        childName = '',
        childAge = '',
        childGender = '';

  UserJson copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? mobileNo,
    String? childName,
    String? childAge,
    String? childGender,
    List<String>? favouriteBlogs,
    List<AssessmentJson>? assessments,
    List<MedicationJson>? medications,
    List<AppointmentJson>? appointments,
    List<ActivityJson>? activities,
  }) =>
      UserJson(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        mobileNo: mobileNo ?? this.mobileNo,
        childAge: childAge ?? this.childAge,
        childName: childName ?? this.childName,
        childGender: childGender ?? this.childGender,
        favouriteBlogs: favouriteBlogs ?? this.favouriteBlogs,
        assessments: assessments ?? this.assessments,
        medications: medications ?? this.medications,
        appointments: appointments ?? this.appointments,
        activities: activities ?? this.activities,
      );

  static UserJson fromJson(Map<String, dynamic> json, String id) {
    return UserJson(
      id: id,
      firstName: json["firstName"] as String? ?? '',
      lastName: json["lastName"] as String? ?? '',
      email: json["email"] as String? ?? '',
      mobileNo: json["mobileNo"] as String? ?? '',
      childName: json["childName"] as String? ?? '',
      childAge: json["childAge"] as String? ?? '',
      childGender: json["childGender"] as String? ?? '',
      favouriteBlogs: List<String>.from(json["favouriteBlogs"].map((x) => x)),
      medications: List<MedicationJson>.from(
          json["medications"].map((x) => MedicationJson.fromJson(x, id))),
      appointments: List<AppointmentJson>.from(
          json["appointments"].map((x) => AppointmentJson.fromJson(x, id))),
      assessments: List<AssessmentJson>.from(
          json["assessments"].map((x) => AssessmentJson.fromJson(x))),
      activities: List<ActivityJson>.from(
          json["activities"].map((x) => ActivityJson.fromJson(x, id))),
    );
  }

  Map<String, dynamic> toJson() => {
        // "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "mobileNo": mobileNo,
        "childName": childName,
        "childAge": childAge,
        "childGender": childGender,
        "favouriteBlogs": List<dynamic>.from(favouriteBlogs.map((e) => e)),
        "medications": List<dynamic>.from(medications.map((e) => e.toJson())),
        "appointments": List<dynamic>.from(appointments.map((e) => e.toJson())),
        "assessments": List<dynamic>.from(assessments.map((e) => e.toJson())),
        "activities": List<dynamic>.from(activities.map((e) => e.toJson())),
      };
}
