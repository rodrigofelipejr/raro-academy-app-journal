import 'package:flutter/material.dart';

import '../constants/constants.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  const FloatingActionButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: 56.0,
        height: 56.0,
        decoration: BoxDecoration(
          gradient: AppColors.kBlueGradient,
          shape: BoxShape.circle,
          boxShadow: [
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
          ],
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
