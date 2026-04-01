import 'package:flutter/material.dart';

class Mood {
  final String id;
  final String label;
  final String emoji;
  final Color color;
  final int level; // 1 (awful) to 5 (rad)

  Mood({
    required this.id,
    required this.label,
    required this.emoji,
    required this.color,
    required this.level,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'label': label,
      'emoji': emoji,
      'color': color.toARGB32(),
      'level': level,
    };
  }

  factory Mood.fromMap(Map<String, dynamic> map) {
    return Mood(
      id: map['id'],
      label: map['label'],
      emoji: map['emoji'],
      color: Color(map['color']),
      level: map['level'],
    );
  }
}

class Activity {
  final String id;
  final String label;
  final String iconName; // Remix icon name
  final String category;

  Activity({
    required this.id,
    required this.label,
    required this.iconName,
    required this.category,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'label': label,
      'iconName': iconName,
      'category': category,
    };
  }

  factory Activity.fromMap(Map<String, dynamic> map) {
    return Activity(
      id: map['id'],
      label: map['label'],
      iconName: map['iconName'],
      category: map['category'],
    );
  }
}

class DiaryEntry {
  final String id;
  final DateTime date;
  final String moodId;
  final List<String> activityIds;
  final String note;
  final List<String> photoPaths;

  DiaryEntry({
    required this.id,
    required this.date,
    required this.moodId,
    required this.activityIds,
    this.note = '',
    this.photoPaths = const [],
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date.toIso8601String(),
      'moodId': moodId,
      'activityIds': activityIds,
      'note': note,
      'photoPaths': photoPaths,
    };
  }

  factory DiaryEntry.fromMap(Map<String, dynamic> map) {
    return DiaryEntry(
      id: map['id'],
      date: DateTime.parse(map['date']),
      moodId: map['moodId'],
      activityIds: List<String>.from(map['activityIds']),
      note: map['note'] ?? '',
      photoPaths: List<String>.from(map['photoPaths'] ?? []),
    );
  }
}
