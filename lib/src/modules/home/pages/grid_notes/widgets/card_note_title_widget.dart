import 'package:flutter/material.dart';

import '../../../../../shared/constants/constants.dart';

class CardNoteTitleWidget extends StatelessWidget {
  final String title;
  final String color;

  const CardNoteTitleWidget({Key? key, required this.title, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        title,
        style: AppTypography.white16w700Roboto(),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 7.75),
      decoration: BoxDecoration(
        color: AppColors.colorPalette[color],
        borderRadius: BorderRadius.circular(4.0),
        boxShadow: AppShadows.kShadowsDefault(),
      ),
    );
  }
}
