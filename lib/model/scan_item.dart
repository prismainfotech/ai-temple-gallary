import 'dart:convert';

enum ScanType { text, url, wifi, contact, sms, email, phone, location, event, barcode, social }

class ScanItem {
  final String id;
  final String content;
  final ScanType type;
  final DateTime dateTime;
  final bool isCreated; // true if generated, false if scanned
  final bool isFavorite;

  ScanItem({
    required this.id,
    required this.content,
    required this.type,
    required this.dateTime,
    this.isCreated = false,
    this.isFavorite = false,
  });

  ScanItem copyWith({bool? isFavorite}) {
    return ScanItem(
      id: id,
      content: content,
      type: type,
      dateTime: dateTime,
      isCreated: isCreated,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'content': content,
      'type': type.index,
      'dateTime': dateTime.toIso8601String(),
      'isCreated': isCreated,
      'isFavorite': isFavorite,
    };
  }

  factory ScanItem.fromMap(Map<String, dynamic> map) {
    return ScanItem(
      id: map['id'],
      content: map['content'],
      type: ScanType.values[map['type']],
      dateTime: DateTime.parse(map['dateTime']),
      isCreated: map['isCreated'] ?? false,
      isFavorite: map['isFavorite'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory ScanItem.fromJson(String source) => ScanItem.fromMap(json.decode(source));
}
