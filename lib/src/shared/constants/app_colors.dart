import 'dart:math';

import 'package:flutter/material.dart';

class AppColors {
  static const Color kPink = Color(0xFFF5487F);
  static const Color kGreen = Color(0xFF58B368);
  static const Color kPurpleDark = Color(0xFF343090);
  static const Color kCyan = Color(0xFF44C2FD);
  static const Color kYellow = Color(0xFFFAC736);
  static const Color kWhite = Color(0xFFFFFFFF);
  static const Color kGreyMedium = Color.fromRGBO(0, 0, 0, 0.54);
  static const Color kBlack = Color.fromRGBO(0, 0, 0, 0.54);
  static const LinearGradient kBlueGradient = LinearGradient(
    colors: <Color>[
      kCyan,
      kPurpleDark,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.1, 0.7],
    transform: GradientRotation((-34 * pi) / 4),
  );
}
