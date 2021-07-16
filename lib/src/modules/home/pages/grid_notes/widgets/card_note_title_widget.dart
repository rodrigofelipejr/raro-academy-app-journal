import 'package:flutter/material.dart';

import '../../../../../shared/constants/constants.dart';
import '../../../../../shared/models/note_model.dart';

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
        color: AppColors.kGreen,
        borderRadius: BorderRadius.circular(4.0),
        boxShadow: [
          BoxShadow(
            color: AppColors.kBlack.withOpacity(0.12),
            offset: Offset(0.0, 1.0),
            blurRadius: 5.0,
          ),
          BoxShadow(
            color: AppColors.kBlack.withOpacity(0.14),
            offset: Offset(0.0, 2.0),
            blurRadius: 2.0,
          ),
          BoxShadow(
            color: AppColors.kBlack.withOpacity(0.20),
            offset: Offset(0.0, 3.0),
            blurRadius: 1.0,
            spreadRadius: -2,
          ),
        ],
      ),
    );
  }
}
