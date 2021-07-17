import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<HomeController>(
        builder: (context, controller, _) {
          if (controller.status == HomeStatus.loading)
            return Center(
              child: CircularProgressIndicator(),
            );

          if (controller.status == HomeStatus.error)
            return Center(
              child: Text('Error'),
            );

          return controller.notes.isEmpty ? EmptyNotesPage() : GridNotesPage();
        },
      ),
    );
  }
}
