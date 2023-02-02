class MedicationJson {
  String id;
  String medicationName;
  DateTime dateTime;

  MedicationJson({
    required this.id,
    required this.medicationName,
    required this.dateTime,
  });

  static MedicationJson fromJson(Map<String, dynamic> json, String id) =>
      MedicationJson(
        id: id,
        medicationName: json["medicationName"] as String? ?? '',
        dateTime: json["dateTime"] as DateTime? ?? DateTime.now(),
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "medicationName": medicationName,
    "dateTime" : dateTime
  };
}
