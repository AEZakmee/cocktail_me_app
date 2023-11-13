import 'package:flutter/material.dart';

import '../utils/extensions.dart';

final class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    required this.hintText,
    required this.icon,
    super.key,
  });

  final String hintText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (_) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            color: context.colors.surfaceColor,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            size: 24,
          ),
        ),
      ),
    );
  }
}
