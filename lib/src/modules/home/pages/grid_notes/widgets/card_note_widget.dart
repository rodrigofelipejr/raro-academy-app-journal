import 'package:flutter/material.dart';
import 'package:journal/src/shared/constants/app_colors.dart';
import 'package:journal/src/shared/constants/constants.dart';

import '../../../../../shared/models/note_model.dart';
import 'widgets.dart';

class CardNoteWidget extends StatelessWidget {
  final NoteModel note;

  const CardNoteWidget({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: AppShadows.kShadowsDefault(),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Card(
        margin: EdgeInsets.zero,
        elevation: 0,
        color: AppColors.kLilac,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CardNoteTitleWidget(note: note),
            CardNoteExtrasWidget(note: note),
            CardNoteDescriptionWidget(description: note.description),
            CardNoteCreateAtWidget(date: note.createdAt)
          ],
        ),
      ),
    );
  }
}
