import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../shared/constants/constants.dart';
import '../../../modules.dart';
import 'button_item_options_bar_widget.dart';

class BottomOptionsBarWidget extends StatelessWidget {
  final void Function() dateFunction;
  final void Function() attachFunction;
  final void Function() favoriteFunction;
  final void Function() shareFunction;
  final void Function() deleteFunction;

  const BottomOptionsBarWidget({
    Key? key,
    required this.dateFunction,
    required this.attachFunction,
    required this.favoriteFunction,
    required this.shareFunction,
    required this.deleteFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.fromLTRB(24.0, 14.0, 24.0, 14.0),
        height: 48.0,
        decoration: BoxDecoration(
          color: AppColors.kWhite,
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
          boxShadow: [
            BoxShadow(
              color: AppColors.kPerano.withOpacity(0.12),
              offset: Offset(0.0, 12.0),
              blurRadius: 21.0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ButtonItemOptionsBarWidget(icon: Icons.date_range, onTap: dateFunction),
            ButtonItemOptionsBarWidget(icon: Icons.attach_file, onTap: attachFunction),
            ButtonItemOptionsBarWidget(
              icon: Icons.favorite_border,
              onTap: favoriteFunction,
              activeIcon: Icons.favorite,
              activeIconColor: AppColors.kRed,
              initialValue: context.read<EditNoteController>().note.isFavorite,
            ),
            ButtonItemOptionsBarWidget(icon: Icons.share, onTap: shareFunction),
            ButtonItemOptionsBarWidget(icon: Icons.delete, onTap: deleteFunction),
          ],
        ),
      ),
    );
  }
}
