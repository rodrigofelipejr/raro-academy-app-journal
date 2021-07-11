import 'package:flutter/material.dart';

import '../../../shared/constants/constants.dart';

class DropdownButtonWidget<T> extends StatelessWidget {
  final T value;
  final Function(T?)? onChanged;
  final List<DropdownMenuItem<T>> items;

  const DropdownButtonWidget({
    Key? key,
    required this.value,
    this.onChanged,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      alignedDropdown: true,
      child: DropdownButton<T>(
        value: value,
        icon: const Icon(
          Icons.arrow_drop_down,
        ),
        // selectedItemBuilder: (BuildContext context) {
        // },
        iconSize: 24,
        elevation: 3,
        focusColor: AppColors.kWhite,
        dropdownColor: AppColors.kWhite,
        underline: SizedBox(),
        onChanged: onChanged, //,
        items: items,
      ),
    );
  }
}
