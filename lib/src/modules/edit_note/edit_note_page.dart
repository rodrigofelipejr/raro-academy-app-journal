import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'edit_note.dart';
import 'widgets/widgets.dart';
import '../modules.dart';
import '../../shared/repositories/repositories.dart';
import '../../shared/mixins/mixins.dart';
import '../../shared/widgets/widgets.dart';

class EditNotePage extends StatefulWidget {
  final String? id;

  const EditNotePage({Key? key, this.id}) : super(key: key);

  @override
  _EditNotePageState createState() => _EditNotePageState();
}

class _EditNotePageState extends State<EditNotePage> with KeyboardManager {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EditNoteController(
        repository: context.read<NoteRepository>(),
        id: widget.id,
      ),
      child: Consumer<EditNoteController>(
        builder: (_, controller, __) {
          if (controller.status.isLoading) {
            return ProgressIndicatorWidget();
          }

          if (controller.status.isErro) {
            return ErrorIndicatorWidget();
          }

          return GestureDetector(
            onTap: () => hideKeyboard(context),
            child: Scaffold(
              appBar: AppBarWidget(),
              body: FormEditNoteWidget(),
              bottomNavigationBar: BottomOptionsBarWidget(),
            ),
          );
        },
      ),
    );
  }
}
