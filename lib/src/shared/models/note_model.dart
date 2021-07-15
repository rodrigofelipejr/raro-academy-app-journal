import 'dart:convert';

import 'package:uuid/uuid.dart';

class NoteModel {
  final String id = Uuid().v1();
  final String color;
  final String title;
  final String description;
  final DateTime? date;
  final String? attachment;
  final bool isFavorite;
  final DateTime createdAt = DateTime.now();
  final DateTime? updatedAt;

  NoteModel({
    required this.color,
    required this.title,
    required this.description,
    this.date,
    this.attachment,
    this.isFavorite = false,
    this.updatedAt,
  });

  NoteModel.empty({
    String? color,
    String? title,
    String? description,
    DateTime? date,
    String? attachment = '',
    bool? isFavorite,
    DateTime? updatedAt,
  })  : color = color ?? '',
        title = title ?? '',
        description = description ?? '',
        date = date ?? null,
        attachment = attachment ?? '',
        isFavorite = isFavorite ?? false,
        updatedAt = date ?? null;

  NoteModel copyWith({
    String? color,
    String? title,
    String? description,
    DateTime? date,
    String? attachment,
    bool? isFavorite,
    DateTime? updatedAt,
  }) {
    return NoteModel(
      color: color ?? this.color,
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      attachment: attachment ?? this.attachment,
      isFavorite: isFavorite ?? this.isFavorite,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'color': color,
      'title': title,
      'description': description,
      'date': date?.toIso8601String(),
      'attachment': attachment,
      'isFavorite': isFavorite,
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      color: map['color'],
      title: map['title'],
      description: map['description'],
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      attachment: map['attachment'],
      isFavorite: map['isFavorite'],
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updatedAt']),
    );
  }

  String toJson() => json.encode(toMap());

  factory NoteModel.fromJson(String source) => NoteModel.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NoteModel &&
        other.color == color &&
        other.title == title &&
        other.description == description &&
        other.date == date &&
        other.attachment == attachment &&
        other.isFavorite == isFavorite &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return color.hashCode ^
        title.hashCode ^
        description.hashCode ^
        date.hashCode ^
        attachment.hashCode ^
        isFavorite.hashCode ^
        updatedAt.hashCode;
  }

  @override
  String toString() {
    return 'NoteModel(color: $color, title: $title, description: $description, date: $date, attachment: $attachment, isFavorite: $isFavorite, updatedAt: $updatedAt)';
  }
}
