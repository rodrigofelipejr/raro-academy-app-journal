import 'package:flutter/material.dart';

import '../../../../shared/constants/constants.dart';

class ButtonItemOptionsBarWidget extends StatefulWidget {
  final void Function() onTap;
  final IconData icon;
  final bool? initialValue;
  final IconData? activeIcon;
  final Color? activeIconColor;

  const ButtonItemOptionsBarWidget({
    Key? key,
    required this.onTap,
    required this.icon,
    this.activeIcon,
    this.initialValue,
    this.activeIconColor,
  })  : assert(activeIcon == null && initialValue == null || activeIcon != null && initialValue != null,
            'activeIcon and initialValue must be entered together.'),
        super(key: key);

  @override
  _ButtonItemOptionsBarWidgetState createState() => _ButtonItemOptionsBarWidgetState();
}

class _ButtonItemOptionsBarWidgetState extends State<ButtonItemOptionsBarWidget> {
  final Color defaultColor = AppColors.kGreyMedium;
  late bool isActive;

  IconData get iconData => isActive ? widget.activeIcon ?? widget.icon : widget.icon;
  Color get activeColor => widget.activeIcon != null ? widget.activeIconColor ?? defaultColor : defaultColor;
  void Function() get onTap => widget.activeIcon != null ? _onTap : widget.onTap;

  @override
  void initState() {
    super.initState();
    isActive = widget.initialValue ?? false;
  }

  void _onTap() {
    widget.onTap();
    setState(() {
      isActive = !isActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.0,
      width: 48.0,
      child: Material(
        color: AppColors.kTransparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onTap,
          child: Icon(
            iconData,
            size: 24.0,
            color: isActive ? activeColor : defaultColor,
          ),
        ),
      ),
    );
  }
}
