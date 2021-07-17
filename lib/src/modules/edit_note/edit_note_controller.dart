import 'package:flutter/material.dart';

import '../../shared/repositories/repositories.dart';
import '../../shared/models/models.dart';

enum EditNoteStatus { none, loading, success, error }

class EditNoteController extends ChangeNotifier {
  final NoteRepository repository;
  final String? id;

  EditNoteController({
    required this.repository,
    this.id,
  }) {
    init();
  }

  NoteModel note = NoteModel.empty();
  EditNoteStatus status = EditNoteStatus.loading;

  bool get buttonSaveVisible => note.title.isNotEmpty && note.description.isNotEmpty;

  void init() async {
    if (id != null) await loadNote();
  }

  void onChange({
    String? color,
    String? title,
    String? description,
    DateTime? date,
    String? attachment,
    bool? isFavorite,
  }) {
    note = note.copyWith(
      color: color ?? note.color,
      title: title ?? note.title,
      description: description ?? note.description,
      date: date ?? note.date,
      attachment: attachment ?? note.attachment,
      isFavorite: isFavorite ?? note.isFavorite,
    );
    notifyListeners();
  }

  Future<bool> saveNote() async {
    try {
      await repository.saveNoteLocalStorage(note);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> loadNote() async {
    try {
      status = EditNoteStatus.loading;

      await Future.delayed(Duration(seconds: 1));
      final data = await repository.loadNoteLocalStorage(id!);
      note = data != null ? data : note;

      status = EditNoteStatus.success;
    } catch (e) {
      status = EditNoteStatus.error;
    } finally {
      notifyListeners();
    }
  }
}
