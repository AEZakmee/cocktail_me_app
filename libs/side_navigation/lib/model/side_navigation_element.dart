import 'package:flutter/material.dart';

class SideNavigationElement {
  SideNavigationElement({
    required this.iconData,
    this.label,
    this.selectedColor,
    this.unselectedColor,
  });

  final IconData iconData;
  final String? label;
  final Color? selectedColor;
  final Color? unselectedColor;
}
