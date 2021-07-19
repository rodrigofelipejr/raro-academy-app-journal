import 'package:flutter/material.dart';

import '../../shared/models/models.dart';
import '../../shared/repositories/repositories.dart';
import '../../shared/mixins/mixins.dart';

class HomeController extends ChangeNotifier {
  final NoteRepository _repository;

  HomeController(this._repository);

  StatusPage status = StatusPage.loading;
  final List<NoteModel> notes = [];

  Future<void> fetchNotes() async {
    try {
      status = StatusPage.loading;

      await Future.delayed(Duration(milliseconds: 500));
      final list = await _repository.loadNotesLocalStorage();
      notes.clear();
      notes.addAll(List.from(list));

      status = StatusPage.success;
    } catch (error) {
      status = StatusPage.error;
    } finally {
      notifyListeners();
    }
  }
}
