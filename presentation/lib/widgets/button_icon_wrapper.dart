import 'package:flutter/material.dart';

class ButtonIconWrapper extends StatelessWidget {
  const ButtonIconWrapper({
    required this.child,
    required this.icon,
    super.key,
  });

  final Widget child;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 28,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: icon,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
