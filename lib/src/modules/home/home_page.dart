import 'package:flutter/material.dart';

import 'widgets/widgets.dart';
import '../../shared/widgets/widgets.dart';
import '../../shared/constants/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButtonWidget(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: AppColors.kBlueGradient,
        ),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                height: screenSize.height * 0.7,
                child: EmptyStartTopWidget(),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: EmptyStartBottomWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
