import 'package:flutter/material.dart';

import '../../utils/extensions.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      color: context.colors.primaryColor,
    );
  }
}
