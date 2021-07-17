import 'package:flutter/material.dart';

import '../../shared/models/models.dart';
import '../../shared/repositories/repositories.dart';

enum HomeStatus { none, loading, success, error }

class HomeController extends ChangeNotifier {
  final NoteRepository _repository;

  HomeController(this._repository);

  HomeStatus status = HomeStatus.loading;
  final List<NoteModel> notes = [];

  Future<void> fetchNotes() async {
    try {
      status = HomeStatus.loading;

      await Future.delayed(Duration(seconds: 2));
      final list = await _repository.loadNotesLocalStorage();
      notes.clear();
      notes.addAll(List.from(list));

      status = HomeStatus.success;
    } catch (error) {
      status = HomeStatus.error;
    } finally {
      notifyListeners();
    }
  }
}
