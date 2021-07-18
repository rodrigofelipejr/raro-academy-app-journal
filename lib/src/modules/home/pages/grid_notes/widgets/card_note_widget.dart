import 'package:flutter/material.dart';

import 'widgets.dart';
import '../../../../../shared/constants/constants.dart';
import '../../../../../shared/models/models.dart';

class CardNoteWidget extends StatelessWidget {
  final NoteModel note;

  const CardNoteWidget({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, AppRoutes.kNoteDetails, arguments: note.uid),
      child: Container(
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
      ),
    );
  }
}
