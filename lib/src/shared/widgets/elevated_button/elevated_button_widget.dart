import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/constants.dart';

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
          gradient: AppGradients.kBlueGradientButton,
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
          boxShadow: AppShadows.kShadowsDefault(),
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
