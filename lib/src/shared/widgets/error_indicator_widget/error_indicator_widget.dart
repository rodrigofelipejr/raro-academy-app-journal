import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class ErrorIndicatorWidget extends StatelessWidget {
  const ErrorIndicatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.close,
              size: 48.0,
              color: AppColors.kRed,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 14.0),
              child: Text('Ops, algo deu errado.'),
            )
          ],
        ),
      ),
    );
  }
}
