import 'package:flutter/material.dart';

import '../utils/extensions.dart';

class AuthScaffold extends StatelessWidget {
  const AuthScaffold({required this.body, super.key});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              context.colors.primaryAccentColor!,
              context.colors.primaryAccentColor!,
              context.colors.primaryColor!,
            ],
          ),
        ),
        child: body,
      ),
    );
  }
}
