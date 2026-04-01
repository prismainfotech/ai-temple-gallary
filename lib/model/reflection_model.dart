class Reflection {
  final int? id;
  final String date; // YYYY-MM-DD
  final int questionId;
  final String questionText;
  final String answer;
  final int mood; // 1-5
  final DateTime createdAt;

  Reflection({
    this.id,
    required this.date,
    required this.questionId,
    required this.questionText,
    required this.answer,
    required this.mood,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'questionId': questionId,
      'questionText': questionText,
      'answer': answer,
      'mood': mood,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory Reflection.fromMap(Map<String, dynamic> map) {
    return Reflection(
      id: map['id'],
      date: map['date'],
      questionId: map['questionId'],
      questionText: map['questionText'],
      answer: map['answer'],
      mood: map['mood'],
      createdAt: DateTime.parse(map['createdAt']),
    );
  }
}
