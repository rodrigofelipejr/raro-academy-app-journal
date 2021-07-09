import 'package:flutter/material.dart';

import '../../../shared/constants/constants.dart';

class EmptyStartBottomWidget extends StatelessWidget {
  const EmptyStartBottomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(14.0),
          topRight: Radius.circular(14.0),
        ),
      ),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.4,
        padding: const EdgeInsets.fromLTRB(40.0, 36.0, 40.0, 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Não importa onde você esteja! Guarde suas ideias pra depois ;)',
              style: AppTypography.purpleDark24w400Roboto(),
            ),
            SizedBox(height: 24.0),
            Text(
              'Comece agora a criar as suas notas!',
              style: AppTypography.cyan16w400Roboto(),
            ),
          ],
        ),
      ),
    );
  }
}
