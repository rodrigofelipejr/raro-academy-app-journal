import 'dart:convert';

class NoteModel {
  final String? id;
  final String color;
  final String title;
  final String description;
  final DateTime? date;
  final String? attachment;
  final bool isFavorite;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  NoteModel({
    this.id,
    required this.color,
    required this.title,
    required this.description,
    this.date,
    this.attachment,
    this.isFavorite = false,
    this.createdAt,
    this.updatedAt,
  });

  NoteModel.empty({
    String? id,
    String? color,
    String? title,
    String? description,
    DateTime? date,
    String? attachment = '',
    bool? isFavorite,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : id = id = '',
        color = color ?? '',
        title = title ?? '',
        description = description ?? '',
        date = date,
        attachment = attachment,
        isFavorite = isFavorite ?? false,
        createdAt = createdAt,
        updatedAt = updatedAt;

  NoteModel copyWith({
    String? id,
    String? color,
    String? title,
    String? description,
    DateTime? date,
    String? attachment,
    bool? isFavorite,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return NoteModel(
      id: id ?? this.id,
      color: color ?? this.color,
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      attachment: attachment ?? this.attachment,
      isFavorite: isFavorite ?? this.isFavorite,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'color': color,
      'title': title,
      'description': description,
      'date': date?.toIso8601String(),
      'attachment': attachment,
      'isFavorite': isFavorite,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      id: map['id'],
      color: map['color'],
      title: map['title'],
      description: map['description'],
      date: map['date'] != null ? DateTime.parse(map['date']) : null,
      attachment: map['attachment'],
      isFavorite: map['isFavorite'],
      createdAt: map['createdAt'] != null ? DateTime.parse(map['createdAt']) : null,
      updatedAt: map['updatedAt'] != null ? DateTime.parse(map['updatedAt']) : null,
    );
  }

  //DateTime.parse('11/10/2018 11:30:44')

  String toJson() => json.encode(toMap());

  factory NoteModel.fromJson(String source) => NoteModel.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NoteModel &&
        other.id == id &&
        other.color == color &&
        other.title == title &&
        other.description == description &&
        other.date == date &&
        other.attachment == attachment &&
        other.isFavorite == isFavorite &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        color.hashCode ^
        title.hashCode ^
        description.hashCode ^
        date.hashCode ^
        attachment.hashCode ^
        isFavorite.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }

  @override
  String toString() {
    return 'NoteModel(id: $id, color: $color, title: $title, description: $description, date: $date, attachment: $attachment, isFavorite: $isFavorite, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}
