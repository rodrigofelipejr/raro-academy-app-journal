import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'edit_note.dart';
import 'widgets/widgets.dart';
import '../../shared/repositories/repositories.dart';
import '../../shared/models/models.dart';
import '../../shared/mixins/mixins.dart';
import '../../shared/widgets/widgets.dart';

class EditNotePage extends StatefulWidget {
  final NoteModel? note;

  const EditNotePage({Key? key, this.note}) : super(key: key);

  @override
  _EditNotePageState createState() => _EditNotePageState();
}

class _EditNotePageState extends State<EditNotePage> with KeyboardManager {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => EditNoteController(context.read<NoteRepository>()),
        ),
      ],
      child: GestureDetector(
        onTap: () => hideKeyboard(context),
        child: Scaffold(
          appBar: AppBarWidget(),
          body: FormEditNoteWidget(),
          bottomNavigationBar: BottomOptionsBarWidget(),
        ),
      ),
    );
  }
}
