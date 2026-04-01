class Question {
  final int id;
  final String text;
  final String category;

  Question({
    required this.id,
    required this.text,
    this.category = 'Daily Reflection',
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      text: json['text'],
      category: json['category'] ?? 'Daily Reflection',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'category': category,
    };
  }
}
