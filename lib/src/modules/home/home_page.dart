import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home.dart';
import '../../shared/widgets/widgets.dart';
import '../../shared/mixins/mixins.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeController _controller;

  @override
  void initState() {
    super.initState();
    _controller = context.read<HomeController>();
    _controller.fetchNotes();
  }

  Widget _buildBasePage(Widget body) => Scaffold(
        appBar: AppBarWidget(lightTheme: false),
        body: body,
      );

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (context, controller, _) {
        if (controller.status.isLoading) {
          return _buildBasePage(
            ProgressIndicatorWidget(),
          );
        }

        if (controller.status.isErro) {
          return _buildBasePage(
            ErrorIndicatorWidget(),
          );
        }

        return controller.notes.isEmpty ? EmptyNotesPage() : GridNotesPage();
      },
    );
  }
}
