import 'package:flutter/material.dart';

import '../../shared/repositories/repositories.dart';
import '../../shared/models/models.dart';

class EditNoteController extends ChangeNotifier {
  final NoteRepository _repository;

  EditNoteController(this._repository);

  NoteModel _note = NoteModel.empty();

  bool get buttonSaveVisible => _note.title.isNotEmpty && _note.description.isNotEmpty;

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

  Future<bool> onSave() async {
    try {
      await _repository.saveNoteLocalStorage(_note);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> onLoadNotes() async {
    try {
      final notes = await _repository.loadNotesLocalStorage();
      print(notes[0]);
      print(notes[0].runtimeType);
      print(notes[0].toString());
    } catch (e) {}
  }
}
