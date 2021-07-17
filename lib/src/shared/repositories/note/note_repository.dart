import 'package:uuid/uuid.dart';

import '../../../shared/models/models.dart';
import '../../services/services.dart';

class NoteRepository {
  Future<void> saveNoteLocalStorage(NoteModel note) async {
    List<String> notes = await LocalStorage.get('notes') ?? [];
    notes.add(_normalizeNote(note).toJson());
    await LocalStorage.set('notes', notes);
  }

  Future<List<NoteModel?>> loadNotesLocalStorage() async {
    List<String> listJson = await LocalStorage.get('notes') ?? [];
    return listJson.map((e) => NoteModel.fromJson(e)).toList();
  }

  Future<NoteModel?> loadNoteLocalStorage(String id) async {
    List<String> listJson = await LocalStorage.get('notes') ?? [];
    if (listJson.isEmpty) return null;

    var notes = listJson.map<NoteModel?>((e) => NoteModel.fromJson(e)).toList();
    var note = notes.firstWhere((e) => e!.id == id, orElse: () => null);
    return note;
  }

  NoteModel _normalizeNote(NoteModel note) {
    return (note.id?.isEmpty == true)
        ? note.copyWith(
            id: Uuid().v1(),
            createdAt: DateTime.now(),
          )
        : note.copyWith(
            updatedAt: DateTime.now(),
          );
  }
}
