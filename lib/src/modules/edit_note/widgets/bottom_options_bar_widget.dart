import 'package:flutter/material.dart';

import '../../../shared/constants/constants.dart';

class BottomOptionsBarWidget extends StatelessWidget {
  final void Function()? dateFunction;
  final void Function()? attachFunction;
  final void Function()? favoriteFunction;
  final void Function()? shareFunction;
  final void Function()? deleteFunction;

  final double buttonSize = 48.0;

  const BottomOptionsBarWidget({
    Key? key,
    this.dateFunction,
    this.attachFunction,
    this.favoriteFunction,
    this.shareFunction,
    this.deleteFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<IconData, void Function()?> _buttonsOptions = {
      // Icons.date_range: dateFunction,
      Icons.date_range: () {},
      Icons.attach_file: attachFunction,
      Icons.favorite_border: favoriteFunction,
      Icons.share: shareFunction,
      Icons.delete: () {},
    };

    return SafeArea(
      child: Container(
        margin: const EdgeInsets.fromLTRB(24.0, 14.0, 24.0, 14.0),
        height: buttonSize,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _buttonsOptions.entries
              .map((e) => Material(
                    color: AppColors.kTransparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: e.value,
                      child: Container(
                        height: buttonSize * 0.9,
                        width: buttonSize * 0.9,
                        child: Icon(
                          e.key,
                          size: 24.0,
                          color: AppColors.kGreyMedium,
                        ),
                      ),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
