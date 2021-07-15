import 'package:journal/src/shared/services/local_storage/local_storage.dart';

import '../../../shared/models/note_model.dart';

class NoteRepository {
  Future<void> saveNoteLocalStorage(NoteModel note) async {
    List<String> notes = await LocalStorage.get('notes') ?? [];
    notes.add(note.toJson());
    await LocalStorage.set('notes', notes);
  }

  Future<List<NoteModel?>> loadNotesLocalStorage() async {
    List<String> listJson = await LocalStorage.get('notes') ?? [];
    return listJson.map((e) => NoteModel.fromJson(e)).toList();
  }

  Future<NoteModel?> loadNoteLocalStorage(String id) async {
    List<String> listJson = await LocalStorage.get('notes') ?? [];
    if (listJson.isEmpty) return null;

    var find = listJson.map((e) => NoteModel.fromJson(e)).toList().where((e) => e.id == id);
    return find.isNotEmpty ? find as NoteModel : null;
  }
}
