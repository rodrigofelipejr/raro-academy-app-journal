import 'package:flutter/material.dart';

import '../../../../../shared/constants/constants.dart';
import '../../../../../shared/models/models.dart';

class CardNoteTitleWidget extends StatelessWidget {
  final NoteModel note;
  const CardNoteTitleWidget({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        note.title,
        style: AppTypography.white16w700Roboto(),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 7.75),
      decoration: BoxDecoration(
        color: AppColors.colorPalette[note.color],
        borderRadius: BorderRadius.circular(4.0),
        boxShadow: AppShadows.kShadowsDefault(),
      ),
    );
  }
}
