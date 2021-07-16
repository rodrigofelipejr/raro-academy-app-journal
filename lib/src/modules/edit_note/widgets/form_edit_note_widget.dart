import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../edit_note_controller.dart';
import '../../../shared/validators/validators.dart';
import '../../../shared/constants/constants.dart';
import '../../../shared/widgets/widgets.dart';
import '../../../shared/mixins/mixins.dart';

import 'widgets.dart';

class FormEditNoteWidget extends StatefulWidget {
  const FormEditNoteWidget({Key? key}) : super(key: key);

  @override
  _FormEditNoteWidgetState createState() => _FormEditNoteWidgetState();
}

class _FormEditNoteWidgetState extends State<FormEditNoteWidget> with KeyboardManager {
  late final EditNoteController _controller;

  final _formKey = GlobalKey<FormState>();
  final List<DropdownMenuItem<String>> _dropdownItems = [];
  final Map<String, dynamic> _dropdownOptions = {
    'rosa': AppColors.kPink,
    'verde': AppColors.kGreen,
    'roxo': AppColors.kPurpleDark,
    'ciano': AppColors.kCyan,
    'amarelo': AppColors.kYellow,
  };

  @override
  void initState() {
    super.initState();
    _controller = context.read<EditNoteController>();
    _buildOptionsDropdown();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _buildOptionsDropdown() {
    _dropdownOptions.forEach((k, v) {
      _dropdownItems.add(
        DropdownMenuItem<String>(
          value: k,
          child: Center(
            child: Container(
              height: 18.0,
              width: 18.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: v,
              ),
            ),
          ),
        ),
      );
    });
  }

  void _handleSubmitForm() async {
    if (_formKey.currentState?.validate() == true) {
      final success = await _controller.saveNote();

      if (success) Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextFormFieldWidget(
                        label: 'Título',
                        onChange: (value) => _controller.onChange(title: value),
                        validator: TitleValidator.validate,
                        labelStyle: AppTypography.gray16w700Roboto(),
                      ),
                    ),
                    DropdownButtonWidget<String>(
                      value: _dropdownOptions.entries.first.key,
                      items: _dropdownItems,
                      onChanged: (value) => _controller.onChange(color: value),
                    ),
                  ],
                ),
                SizedBox(height: 12.0),
                Expanded(
                  child: TextFormFieldWidget(
                    label: 'Digite aqui...',
                    onChange: (value) => _controller.onChange(description: value),
                    validator: DescriptionValidator.validate,
                    expands: true,
                    maxLines: null,
                    textInputType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                    textAlignVertical: TextAlignVertical.top,
                  ),
                ),
              ],
            ),
            ButtonSaveNoteWidget(onPressed: _handleSubmitForm),
          ],
        ),
      ),
    );
  }
}
