import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBarWidget(),
      body: GestureDetector(
        onTap: () => hideKeyboard(context),
        child: FormEditNoteWidget(),
      ),
      bottomNavigationBar: BottomOptionsBarWidget(),
    );
  }
}

//MediaQuery.of(context).viewInsets.bottom ==0 // Visibility