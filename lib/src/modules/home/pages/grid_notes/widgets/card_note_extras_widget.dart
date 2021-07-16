import 'package:flutter/material.dart';

import '../../../../../shared/models/models.dart';
import '../../../../../shared/constants/constants.dart';

class CardNoteExtrasWidget extends StatelessWidget {
  final NoteModel note;
  const CardNoteExtrasWidget({Key? key, required this.note}) : super(key: key);

  bool get isDateEnable => note.date != null;
  bool get isAttachmentEnable => note.attachment?.isNotEmpty == true;
  bool get isFavoriteEnable => note.isFavorite;

  Widget _buildItemIcon(IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, right: 8.0),
      child: Icon(
        icon,
        color: AppColors.kGreyMedium,
        size: 13.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (isDateEnable) _buildItemIcon(Icons.date_range),
        if (isAttachmentEnable) _buildItemIcon(Icons.attach_file),
        if (isFavoriteEnable) _buildItemIcon(Icons.favorite),
      ],
    );
  }
}
