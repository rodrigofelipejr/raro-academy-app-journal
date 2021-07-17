import 'package:flutter/material.dart';

import 'widgets/widgets.dart';
import '../../../../shared/widgets/widgets.dart';
import '../../../../shared/constants/constants.dart';

class EmptyNotesPage extends StatelessWidget {
  const EmptyNotesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButtonWidget(
        onTap: () => Navigator.pushNamed(context, AppRoutes.kNoteDetails),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: AppGradients.kBlueGradient,
        ),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                height: screenSize.height * 0.7,
                child: SessionTopWidget(),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SessionBottomWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
