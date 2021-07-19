import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../modules.dart';
import 'widgets/widgets.dart';
import '../../../../shared/widgets/widgets.dart';
import '../../../../shared/constants/constants.dart';

class EmptyNotesPage extends StatefulWidget {
  const EmptyNotesPage({Key? key}) : super(key: key);

  @override
  _EmptyNotesPageState createState() => _EmptyNotesPageState();
}

class _EmptyNotesPageState extends State<EmptyNotesPage> {
  late final HomeController _controller;

  @override
  void initState() {
    super.initState();
    _controller = context.read<HomeController>();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButtonWidget(
        onTap: () => Navigator.pushNamed(context, AppRoutes.kNoteDetails).then((_) async {
          await _controller.fetchNotes();
          setState(() {});
        }),
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
