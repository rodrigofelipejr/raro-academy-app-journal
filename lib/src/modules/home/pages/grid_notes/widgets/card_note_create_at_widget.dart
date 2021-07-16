import 'package:flutter/material.dart';

import '../../../../../shared/constants/constants.dart';
import '../../../../../shared/helpers/helpers.dart';

class CardNoteCreateAtWidget extends StatelessWidget {
  final DateTime? date;
  const CardNoteCreateAtWidget({Key? key, this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, bottom: 8.0, left: 8.0),
      child: Text(
        'Criação: ${date?.formatToString()}',
        style: AppTypography.gray10w300Roboto(),
      ),
    );
  }
}
