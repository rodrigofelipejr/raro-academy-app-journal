import 'package:flutter/material.dart';

class AppColors {
  static const Color kTransparent = Colors.transparent;
  static const Color kBlack = Color.fromRGBO(0, 0, 0, 1);
  static const Color kWhite = Color(0xFFFFFFFF);
  static const Color kPink = Color(0xFFF5487F);
  static const Color kGreen = Color(0xFF58B368);
  static const Color kPurple = Color(0xFF8681FC);
  static const Color kPurpleDark = Color(0xFF343090);
  static const Color kCyan = Color(0xFF44C2FD);
  static const Color kYellow = Color(0xFFFAC736);
  static const Color kRed = Color(0xFFFF616D);
  static const Color kGreyMedium = Color.fromRGBO(0, 0, 0, 0.54);
  static const Color kPerano = Color(0xFFA7A4F1);
  static const Color kLilac = Color(0xFFF2F5FA);
  static final Map<String, Color> colorPalette = {
    'rosa': AppColors.kPink,
    'verde': AppColors.kGreen,
    'roxo': AppColors.kPurple,
    'ciano': AppColors.kCyan,
    'amarelo': AppColors.kYellow,
  };
}
