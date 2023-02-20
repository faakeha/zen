class ActivityJson {
  String id;
  String activityName;
  DateTime dateTime;

  ActivityJson({
    required this.id,
    required this.activityName,
    required this.dateTime,
  });

  static ActivityJson fromJson(Map<String, dynamic> json, String id) =>
      ActivityJson(
        id: id,
        activityName: json["activityName"] as String? ?? '',
        dateTime: json["dateTime"] as DateTime? ?? DateTime.now(),
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "activityName": activityName,
    "dateTime" : dateTime
  };
}
