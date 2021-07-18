import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  final void Function() onTap;

  const FloatingActionButtonWidget({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  double get sizeDefault => 56;
  BorderRadius get borderRadius => BorderRadius.circular(sizeDefault);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppGradients.kBlueGradient,
        color: AppColors.kCyan,
        shape: BoxShape.circle,
        boxShadow: AppShadows.kShadowsFloatingActionButton(),
      ),
      child: Material(
        color: AppColors.kTransparent,
        borderRadius: borderRadius,
        child: InkWell(
          borderRadius: borderRadius,
          onTap: onTap,
          child: Container(
            width: sizeDefault,
            height: sizeDefault,
            child: Center(
              child: Icon(Icons.add, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
