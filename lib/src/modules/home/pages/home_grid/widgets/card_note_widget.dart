import 'package:flutter/material.dart';

import '../../../../../shared/models/note_model.dart';
import '../../../../../shared/helpers/helpers.dart';

class CardNoteWidget extends StatelessWidget {
  final NoteModel note;

  const CardNoteWidget({Key? key, required this.note}) : super(key: key);

  bool get isDateEnable => note.date != null;
  bool get isAttachmentEnable => note.attachment?.isNotEmpty == true;
  bool get isFavoriteEnable => note.isFavorite;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(
            child: Text(note.title),
          ),
          Row(
            children: [
              if (isDateEnable) Icon(Icons.date_range),
              if (isAttachmentEnable) Icon(Icons.attach_file),
              if (isFavoriteEnable) Icon(Icons.favorite),
            ],
          ),
          Container(
            child: Text(note.description),
          ),
          Text(
            'Criação: ${note.createdAt?.formatToString()}',
          ),
        ],
      ),
    );
  }
}
