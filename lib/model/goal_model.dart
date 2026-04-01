class Goal {
  final String id;
  final String title;
  final String iconName;
  final int colorValue;
  final int targetPerWeek; // e.g. 7 for daily
  final List<DateTime> completionDates;

  Goal({
    required this.id,
    required this.title,
    required this.iconName,
    required this.colorValue,
    this.targetPerWeek = 7,
    List<DateTime>? completionDates,
  }) : completionDates = completionDates ?? [];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'iconName': iconName,
      'colorValue': colorValue,
      'targetPerWeek': targetPerWeek,
      'completionDates': completionDates.map((d) => d.toIso8601String()).toList(),
    };
  }

  factory Goal.fromMap(Map<String, dynamic> map) {
    return Goal(
      id: map['id'],
      title: map['title'],
      iconName: map['iconName'],
      colorValue: map['colorValue'],
      targetPerWeek: map['targetPerWeek'] ?? 7,
      completionDates: (map['completionDates'] as List?)
              ?.map((d) => DateTime.parse(d))
              .toList() ??
          [],
    );
  }
  
  bool isCompletedOn(DateTime date) {
    return completionDates.any((d) =>
        d.year == date.year && d.month == date.month && d.day == date.day);
  }
}
