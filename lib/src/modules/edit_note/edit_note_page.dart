import 'package:flutter/material.dart';
import 'package:journal/src/modules/edit_note/edit_note_controller.dart';

import '../../shared/mixins/mixins.dart';
import '../../shared/widgets/widgets.dart';
import 'widgets/widgets.dart';

class EditNotePage extends StatefulWidget {
  const EditNotePage({Key? key}) : super(key: key);

  @override
  _EditNotePageState createState() => _EditNotePageState();
}

class _EditNotePageState extends State<EditNotePage> with KeyboardManager {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => hideKeyboard(context),
      child: Scaffold(
        appBar: AppBarWidget(),
        body: FormEditNoteWidget(),
        bottomNavigationBar: BottomOptionsBarWidget(),
      ),
    );
  }
}

//MediaQuery.of(context).viewInsets.bottom ==0 // Visibility