import 'package:flutter/material.dart';
import 'package:journal/src/shared/models/note_model.dart';

class EditNoteController extends ChangeNotifier {
  late NoteModel _note;

  void onChange({
    String? color,
    String? title,
    String? description,
    DateTime? date,
    String? attachment,
    bool? isFavorite,
  }) {
    _note = _note.copyWith(
      color: color ?? _note.color,
      title: title ?? _note.title,
      description: description ?? _note.description,
      date: date ?? _note.date,
      attachment: attachment ?? _note.attachment,
      isFavorite: isFavorite ?? _note.isFavorite,
    );
    notifyListeners();
  }
}
