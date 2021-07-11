import 'package:flutter/material.dart';
import 'package:journal/src/shared/constants/constants.dart';

import 'package:journal/src/shared/widgets/widgets.dart';

import 'widgets.dart';

class FormEditNoteWidget extends StatefulWidget {
  const FormEditNoteWidget({Key? key}) : super(key: key);

  @override
  _FormEditNoteWidgetState createState() => _FormEditNoteWidgetState();
}

class _FormEditNoteWidgetState extends State<FormEditNoteWidget> {
  final List<DropdownMenuItem<String>> _dropdownItems = [];
  final _formKey = GlobalKey();

  final Map<String, dynamic> _dropdownOptions = {
    'rosa': AppColors.kPink,
    'verde': AppColors.kGreen,
    'roxo': AppColors.kPurpleDark,
    'ciano': AppColors.kCyan,
    'amarelo': AppColors.kYellow,
  };

  late String _typeNote;

  @override
  void initState() {
    super.initState();
    _buildOptionsDropdown();
    _typeNote = _dropdownOptions.entries.first.key;
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
                        onChange: (value) {},
                        validator: (value) {},
                        labelStyle: AppTypography.gray16w700Roboto(),
                      ),
                    ),
                    DropdownButtonWidget<String>(
                      value: _typeNote,
                      items: _dropdownItems,
                      onChanged: _handleChangeDropdown,
                    ),
                  ],
                ),
                SizedBox(height: 12.0),
                Expanded(
                  child: TextFormFieldWidget(
                    label: 'Digite aqui...',
                    onChange: (value) {},
                    validator: (value) {},
                    expands: true,
                    maxLines: null,
                    textInputType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                    textAlignVertical: TextAlignVertical.top,
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 14.0,
              right: 14.0,
              child: ElevatedButtonWidget(
                onPressed: () {},
                label: 'SALVAR',
              ),
            ),
          ],
        ),
      ),
    );
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

  void _handleChangeDropdown(String? value) {
    setState(() {
      _typeNote = value!;
    });
  }
}