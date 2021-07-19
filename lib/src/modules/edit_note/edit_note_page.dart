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
  void _handleDeleteNote(EditNoteController controller) async {
    final bool delete = await showDialog<bool>(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Text('Você tem certeza que quer deletar esta nota?'),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  child: const Text('NÃO'),
                  onPressed: () => Navigator.of(context).pop(false),
                ),
                TextButton(
                  child: const Text('SIM'),
                  onPressed: () => Navigator.of(context).pop(true),
                ),
              ],
            );
          },
        ) ??
        false;

    if (!delete) return;

    if (await controller.removeNote()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: SnackBarWidget(label: 'A nota foi removida'),
          duration: Duration(seconds: 2),
        ),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: SnackBarWidget(label: 'Erro ao excluir nota'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EditNoteController(
        repository: context.read<NoteRepository>(),
        id: widget.id,
      ),
      child: GestureDetector(
        onTap: () => hideKeyboard(context),
        child: Scaffold(
          appBar: AppBarWidget(),
          body: Consumer<EditNoteController>(
            builder: (_, controller, __) {
              if (controller.status.isLoading) {
                return ProgressIndicatorWidget();
              }

              if (controller.status.isErro) {
                return ErrorIndicatorWidget();
              }

              return FormEditNoteWidget();
            },
          ),
          bottomNavigationBar: Consumer<EditNoteController>(
            builder: (_, controller, __) {
              return controller.status.isSuccess
                  ? BottomOptionsBarWidget(
                      dateFunction: () {},
                      attachFunction: () {},
                      favoriteFunction: () => controller.onChange(isFavorite: !controller.note.isFavorite),
                      shareFunction: () {},
                      deleteFunction: widget.id != null ? () => _handleDeleteNote(controller) : null,
                    )
                  : SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
