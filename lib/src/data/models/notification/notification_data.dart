class NotificationModel {
  late String contents;
  late String headings;
  late int completedAt;

  NotificationModel(
      {required this.contents,
      required this.headings,
      required this.completedAt});

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      contents: json['contents']['en'] ?? '',
      headings: json['headings']['en'] ?? '',
      completedAt: json['completed_at'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        'contents': {'en': contents},
        'headings': {'en': headings},
        'completed_at': completedAt
      };
}
