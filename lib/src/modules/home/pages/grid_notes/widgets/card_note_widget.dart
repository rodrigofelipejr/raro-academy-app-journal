import 'package:flutter/material.dart';

import 'widgets.dart';
import '../../../../../shared/constants/constants.dart';
import '../../../../../shared/models/models.dart';

class CardNoteWidget extends StatelessWidget {
  final NoteModel note;
  final void Function() onTap;

  const CardNoteWidget({Key? key, required this.note, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: AppShadows.kShadowsDefault(),
        borderRadius: BorderRadius.circular(4.0),
        color: AppColors.kLilac,
      ),
      child: Material(
        color: AppColors.kTransparent,
        child: InkWell(
          onTap: onTap ,
          child: Card(
            margin: EdgeInsets.zero,
            elevation: 0,
            color: AppColors.kTransparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CardNoteTitleWidget(title: note.title, color: note.color),
                CardNoteExtrasWidget(note: note),
                CardNoteDescriptionWidget(description: note.description),
                CardNoteCreateAtWidget(date: note.createdAt)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
