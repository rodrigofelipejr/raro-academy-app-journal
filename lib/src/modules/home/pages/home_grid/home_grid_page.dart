import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../../home.dart';
import 'widgets/widgets.dart';

class HomeGridPage extends StatefulWidget {
  const HomeGridPage({Key? key}) : super(key: key);

  @override
  _HomeGridPageState createState() => _HomeGridPageState();
}

class _HomeGridPageState extends State<HomeGridPage> {
  late final HomeController _controller;

  @override
  void initState() {
    super.initState();
    _controller = context.read<HomeController>();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _controller.fetchNotes,
      child: StaggeredGridView.countBuilder(
        staggeredTileBuilder: (index) => StaggeredTile.count(1, index.isEven ? 1.5 : 2),
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        crossAxisCount: 2,
        itemCount: _controller.notes.length,
        itemBuilder: (context, index) {
          return CardNoteWidget(note: _controller.notes[index]);
        },
      ),
    );
  }
}
