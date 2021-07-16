import 'package:flutter/material.dart';

import '../../shared/models/models.dart';
import '../../shared/repositories/repositories.dart';

enum HomeStatus { loading, success, error }

class HomeController extends ChangeNotifier {
  final NoteRepository _repository;

  HomeController(this._repository);

  HomeStatus state = HomeStatus.loading;
  final List<NoteModel> notes = [];

  Future<void> fetchNotes() async {
    try {
      state = HomeStatus.loading;
      await Future.delayed(Duration(seconds: 2));
      final list = await _repository.loadNotesLocalStorage();
      notes.clear();
      notes.addAll(List.from(list));
      state = HomeStatus.success;
    } catch (error) {
      print(error);
      state = HomeStatus.error;
    } finally {
      notifyListeners();
    }
  }
}
