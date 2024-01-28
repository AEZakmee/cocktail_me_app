import 'package:flutter/material.dart';

import '../utils/extensions.dart';

class MainScaffold extends StatelessWidget {
  const MainScaffold({
    required this.body,
    this.appBar,
    this.drawer,
    this.bottomNavigationBar,
    this.extendBodyBehindAppBar,
    super.key,
  });

  final PreferredSizeWidget? appBar;
  final Widget? drawer;
  final Widget body;
  final Widget? bottomNavigationBar;
  final bool? extendBodyBehindAppBar;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
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
      child: Scaffold(
        extendBodyBehindAppBar: extendBodyBehindAppBar ?? false,
        appBar: appBar,
        drawer: drawer,
        body: SafeArea(child: body),
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
