import 'package:flutter/material.dart';

import '../../../../../shared/constants/constants.dart';

class CardNoteDescriptionWidget extends StatelessWidget {
  final String description;
  const CardNoteDescriptionWidget({Key? key, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        children: [
          Text(
            description,
            style: AppTypography.gray14w400Roboto(),
            overflow: TextOverflow.ellipsis,
            maxLines: 10,
          ),
        ],
      ),
    );
  }
}
