import 'dart:math';

import 'package:flutter/material.dart';

import 'constants.dart';

class AppGradients {
  static const LinearGradient kBlueGradient = LinearGradient(
    colors: <Color>[
      AppColors.kCyan,
      AppColors.kPurpleDark,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.1, 0.7],
    transform: GradientRotation((-34 * pi) / 180), // graus para radianos
  );

  static const LinearGradient kBlueGradientButton = LinearGradient(
    colors: <Color>[
      AppColors.kCyan,
      AppColors.kPurpleDark,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.05, 0.8],
    transform: GradientRotation((40 * pi) / 180), // graus para radianos
  );

  static const LinearGradient kBlueGradientAppBar = LinearGradient(
    colors: <Color>[
      AppColors.kCyan,
      AppColors.kPurpleDark,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.09, 0.65],
    transform: GradientRotation((60 * pi) / 180), // graus para radianos
  );
}
