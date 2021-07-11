import 'dart:convert';

class NoteModel {
  final String color;
  final String title;
  final String description;
  final DateTime date;
  final String? attachment;
  final bool isFavorite;

  NoteModel({
    required this.color,
    required this.title,
    required this.description,
    required this.date,
    this.attachment,
    this.isFavorite = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'color': color,
      'title': title,
      'description': description,
      'date': date.millisecondsSinceEpoch,
      'attachment': attachment,
      'isFavorite': isFavorite,
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
    );
  }

  String toJson() => json.encode(toMap());

  factory NoteModel.fromJson(String source) => NoteModel.fromMap(json.decode(source));

  NoteModel copyWith({
    String? color,
    String? title,
    String? description,
    DateTime? date,
    String? attachment,
    bool? isFavorite,
  }) {
    return NoteModel(
      color: color ?? this.color,
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      attachment: attachment ?? this.attachment,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NoteModel &&
        other.color == color &&
        other.title == title &&
        other.description == description &&
        other.date == date &&
        other.attachment == attachment &&
        other.isFavorite == isFavorite;
  }

  @override
  int get hashCode {
    return color.hashCode ^
        title.hashCode ^
        description.hashCode ^
        date.hashCode ^
        attachment.hashCode ^
        isFavorite.hashCode;
  }

  @override
  String toString() {
    return 'NoteModel(color: $color, title: $title, description: $description, date: $date, attachment: $attachment, isFavorite: $isFavorite)';
  }
}
