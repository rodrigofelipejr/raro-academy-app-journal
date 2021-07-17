import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'edit_note.dart';
import 'widgets/widgets.dart';
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
  void initState() {
    super.initState();
  }

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
