import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../../home.dart';
import '../../../../shared/constants/constants.dart';
import '../../../../shared/widgets/widgets.dart';
import 'widgets/widgets.dart';

class GridNotesPage extends StatefulWidget {
  const GridNotesPage({Key? key}) : super(key: key);

  @override
  _GridNotesPageState createState() => _GridNotesPageState();
}

class _GridNotesPageState extends State<GridNotesPage> {
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
      child: Scaffold(
        appBar: AppBarWidget(lightTheme: false),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButtonWidget(
          onTap: () => Navigator.pushNamed(context, AppRoutes.kNotes),
        ),
        body: StaggeredGridView.countBuilder(
          staggeredTileBuilder: (index) => StaggeredTile.fit(1),
          mainAxisSpacing: 6,
          crossAxisSpacing: 6,
          crossAxisCount: 2,
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
          itemCount: _controller.notes.length,
          itemBuilder: (context, index) {
            return CardNoteWidget(note: _controller.notes[index]);
          },
        ),
      ),
    );
  }
}
