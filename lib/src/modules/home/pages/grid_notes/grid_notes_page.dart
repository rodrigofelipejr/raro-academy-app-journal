import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../home.dart';
import '../../../../shared/mixins/mixins.dart';
import '../../../../shared/constants/constants.dart';
import '../../../../shared/widgets/widgets.dart';
import 'widgets/widgets.dart';

class GridNotesPage extends StatefulWidget {
  const GridNotesPage({Key? key}) : super(key: key);

  @override
  _GridNotesPageState createState() => _GridNotesPageState();
}

class _GridNotesPageState extends State<GridNotesPage> with KeyboardManager {
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
      child: GestureDetector(
        onTap: () => hideKeyboard(context),
        child: Scaffold(
          appBar: AppBarWidget(lightTheme: false),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButtonWidget(
            onTap: () => Navigator.pushNamed(context, AppRoutes.kNoteDetails).then((_) async {
              await _controller.fetchNotes();
              setState(() {});
            }),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 24.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Pesquisar',
                    suffixIcon: Icon(Icons.search),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: StaggeredGridView.countBuilder(
                  staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                  mainAxisSpacing: 12.0,
                  crossAxisSpacing: 12.0,
                  crossAxisCount: 2,
                  padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
                  itemCount: _controller.notes.length,
                  itemBuilder: (context, index) {
                    return CardNoteWidget(
                      note: _controller.notes[index],
                      onTap: () => Navigator.pushNamed(
                        context,
                        AppRoutes.kNoteDetails,
                        arguments: _controller.notes[index].uid,
                      ).then((_) async {
                        await _controller.fetchNotes();
                        setState(() {});
                      }),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
