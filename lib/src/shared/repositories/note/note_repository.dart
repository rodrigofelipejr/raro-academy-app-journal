import 'package:uuid/uuid.dart';

import '../../../shared/models/models.dart';
import '../../services/services.dart';

class NoteRepository {
  Future<void> saveNoteLocalStorage(NoteModel note) async {
    note.uid.isEmpty ? await _saveLocalStorage(note) : await _updateLocalStorage(note);
  }

  Future<void> _saveLocalStorage(NoteModel note) async {
    List<String> notes = await LocalStorage.get('notes') ?? [];

    notes.add(note
        .copyWith(
          uid: Uuid().v1(),
          createdAt: DateTime.now(),
        )
        .toJson());

    await LocalStorage.set('notes', notes);
  }

  Future<void> _updateLocalStorage(NoteModel note) async {
    List<String> json = await LocalStorage.get('notes') ?? [];
    List<NoteModel> notes = json.map((e) => NoteModel.fromJson(e)).toList();

    notes[notes.indexWhere((e) => e.uid == note.uid)] = note.copyWith(
      updatedAt: DateTime.now(),
    );

    await LocalStorage.set('notes', notes.map((e) => e.toJson()).toList());
  }

  Future<List<NoteModel?>> loadNotesLocalStorage() async {
    List<String> listJson = await LocalStorage.get('notes') ?? [];
    return listJson.map((e) => NoteModel.fromJson(e)).toList();
  }

  Future<NoteModel?> loadNoteLocalStorage(String id) async {
    List<String> listJson = await LocalStorage.get('notes') ?? [];
    if (listJson.isEmpty) return null;

    var notes = listJson.map<NoteModel?>((e) => NoteModel.fromJson(e)).toList();
    var note = notes.firstWhere((e) => e!.uid == id, orElse: () => null);
    return note;
  }

  Future<bool> removeNoteLocalStorage(String id) async {
    List<String> listJson = await LocalStorage.get('notes') ?? [];
    if (listJson.isEmpty) return true;

    var notes = listJson.map<NoteModel>((e) => NoteModel.fromJson(e)).toList();
    notes.removeWhere((e) => e.uid == id);

    var newNotes = notes.map((e) => e.toJson()).toList();
    return await LocalStorage.set('notes', newNotes);
  }
}
