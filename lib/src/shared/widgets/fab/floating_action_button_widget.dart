import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  final void Function() onTap;

  const FloatingActionButtonWidget({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 56.0,
        height: 56.0,
        decoration: BoxDecoration(
          gradient: AppGradients.kBlueGradient,
          shape: BoxShape.circle,
          boxShadow: AppShadows.kShadowsFloatingActionButton(),
        ),
        child: Center(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
