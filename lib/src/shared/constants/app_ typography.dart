import 'package:flutter/material.dart';
import 'package:journal/src/shared/constants/app_colors.dart';

/* COR TAMANHO ESPESSURA NOME-FONT */

class AppTypography {
  static TextStyle white72w700Montserrat() => TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 72.0,
        fontWeight: FontWeight.w700,
        color: AppColors.kWhite,
        letterSpacing: -0.05,
      );

  static TextStyle white54w700Montserrat() => TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 54.0,
        fontWeight: FontWeight.w700,
        color: AppColors.kWhite,
        letterSpacing: -1.6,
      );

  static TextStyle white13w400Montserrat() => TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: AppColors.kWhite,
        letterSpacing: 1.0,
      );

  static TextStyle whiteOpacity13w300Roboto() => TextStyle(
        fontFamily: 'Roboto',
        fontSize: 13,
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.italic,
        color: AppColors.kWhite.withOpacity(0.5),
        letterSpacing: 2.0,
      );

  static TextStyle purpleDark24w400Roboto() => TextStyle(
        fontFamily: 'Roboto',
        fontSize: 24.0,
        fontWeight: FontWeight.w400,
        color: AppColors.kPurpleDark,
      );

  static TextStyle cyan16w400Roboto() => TextStyle(
        fontFamily: 'Roboto',
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        color: AppColors.kCyan,
      );
}
