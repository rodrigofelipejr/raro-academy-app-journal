import 'package:flutter/material.dart';
import 'package:journal/src/shared/constants/app_colors.dart';
import 'package:journal/src/shared/constants/constants.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String label;

  const ElevatedButtonWidget({
    Key? key,
    this.onPressed,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 48.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: AppColors.kBlueGradientButton,
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
          boxShadow: [
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
              spreadRadius: -2.0,
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            label,
            style: AppTypography.white14w500Roboto(),
          ),
          style: ElevatedButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              primary: AppColors.kTransparent,
              shadowColor: AppColors.kTransparent,
              padding: const EdgeInsets.symmetric(horizontal: 24.0)),
        ),
      ),
    );
  }
}
