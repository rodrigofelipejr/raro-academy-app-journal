import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../shared/constants/constants.dart';

class EmptyStartTopWidget extends StatelessWidget {
  const EmptyStartTopWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        ColorFiltered(
          colorFilter: const ColorFilter.mode(
            AppColors.kCyan,
            BlendMode.modulate,
          ),
          child: Image.asset(
            AppImages.studentBackground,
            fit: BoxFit.cover,
            colorBlendMode: BlendMode.modulate,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'hero_logo_journal',
              child: SvgPicture.asset(
                AppImages.logoJournalIcon,
                height: 58,
                width: 58,
              ),
            ),
            Hero(
              tag: 'hero_journal',
              child: Material(
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 14.0, left: 4.0),
                  child: Text(
                    'journal',
                    style: AppTypography.white54w700Montserrat(),
                  ),
                ),
              ),
            ),
          ],
        ),
        SafeArea(
          child: Align(
            alignment: Alignment.topCenter,
            child: SvgPicture.asset(
              AppImages.studentHat,
              height: 68,
              width: 68,
            ),
          ),
        ),
      ],
    );
  }
}
