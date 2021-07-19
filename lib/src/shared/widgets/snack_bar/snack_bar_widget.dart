import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class SnackBarWidget extends StatelessWidget {
  final String label;

  const SnackBarWidget({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        label,
        style: AppTypography.white14w500Roboto(),
      ),
    );
  }
}
