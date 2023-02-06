class AppointmentJson {
  String id;
  String appointmentTitle;
  DateTime dateTime;

  AppointmentJson({
    required this.id,
    required this.appointmentTitle,
    required this.dateTime,
  });

  static AppointmentJson fromJson(Map<String, dynamic> json, String id) =>
      AppointmentJson(
        id: id,
        appointmentTitle: json["appointmentTitle"] as String? ?? '',
        dateTime: json["dateTime"] as DateTime? ?? DateTime.now(),
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "appointmentTitle": appointmentTitle,
    "dateTime" : dateTime
  };
}
