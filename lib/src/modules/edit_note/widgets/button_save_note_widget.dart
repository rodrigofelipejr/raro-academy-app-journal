import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../edit_note_controller.dart';
import '../../../shared/widgets/widgets.dart';

class ButtonSaveNoteWidget extends StatelessWidget {
  final void Function()? onPressed;

  const ButtonSaveNoteWidget({
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EditNoteController _controller = context.read<EditNoteController>();

    return Consumer<EditNoteController>(
      builder: (context, cart, child) {
        return Visibility(
          visible: _controller.buttonSaveVisible,
          child: Positioned(
            bottom: 14.0,
            right: 14.0,
            child: ElevatedButtonWidget(
              onPressed: onPressed,
              label: 'SALVAR',
            ),
          ),
        );
      },
    );
  }
}
