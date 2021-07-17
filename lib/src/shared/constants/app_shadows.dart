import 'package:flutter/material.dart';

import 'constants.dart';

class AppShadows {
  static List<BoxShadow> kShadowsDefault() => [
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
      ];

  static List<BoxShadow> kShadowsFloatingActionButton() => [
        BoxShadow(
          color: AppColors.kBlack.withOpacity(0.12),
          offset: Offset(0.0, 1.0),
          blurRadius: 18.0,
        ),
        BoxShadow(
          color: AppColors.kBlack.withOpacity(0.14),
          offset: Offset(0.0, 6.0),
          blurRadius: 10.0,
        ),
        BoxShadow(
          color: AppColors.kBlack.withOpacity(0.20),
          offset: Offset(0.0, 3.0),
          blurRadius: 5.0,
          spreadRadius: -1,
        ),
      ];
}
