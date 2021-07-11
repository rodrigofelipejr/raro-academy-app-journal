import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/constants.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String label;
  final String? Function(String? value) validator;
  final ValueChanged<String> onChange;
  final TextEditingController? controller;
  final String? initialValue;
  final bool obscureText;
  final TextInputType textInputType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? textInputFormatter;
  final int? maxLines;
  final bool expands;
  final TextAlignVertical? textAlignVertical;
  final TextStyle? labelStyle;

  const TextFormFieldWidget({
    Key? key,
    required this.label,
    required this.validator,
    required this.onChange,
    this.controller,
    this.obscureText = false,
    this.initialValue,
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.textInputFormatter,
    this.maxLines = 1,
    this.expands = false,
    this.textAlignVertical,
    this.labelStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 56.0),
      child: TextFormField(
        controller: controller,
        onChanged: onChange,
        initialValue: initialValue,
        maxLines: maxLines,
        expands: expands,
        textAlignVertical: textAlignVertical,
        validator: validator,
        textInputAction: textInputAction,
        obscureText: obscureText,
        keyboardType: textInputType,
        inputFormatters: textInputFormatter,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(14.0, 14.0, 14.0, 0.0),
          alignLabelWithHint: true,
          labelText: label,
          labelStyle: labelStyle ?? AppTypography.gray14w400Roboto(), //TODO - refactor
          errorMaxLines: 2,
          fillColor: AppColors.kWhite,
          filled: true,
          // isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(
              width: 1,
              color: AppColors.kTransparent,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(14.0)),
            borderSide: BorderSide(
              width: 1,
              color: AppColors.kTransparent,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(
              width: 1,
              color: AppColors.kTransparent,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(
              width: 1,
              color: AppColors.kRed, //TODO - check
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(
              width: 1,
              color: AppColors.kTransparent,
            ),
          ),
          errorStyle: AppTypography.red13w400Roboto(),
        ),
      ),
    );
  }
}
