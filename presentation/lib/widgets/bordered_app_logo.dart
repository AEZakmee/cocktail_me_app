import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../theme/cocktail_me_icons.dart';
import '../utils/extensions.dart';

final class BorderedAppLogo extends StatelessWidget {
  const BorderedAppLogo({
    required this.size,
    super.key,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(size * 3 / 4),
      decoration: BoxDecoration(
        color: context.colors.surfaceColor?.withOpacity(0.2),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Transform.rotate(
        angle: math.pi / 4,
        child: Container(
          padding: EdgeInsets.all(size * 3 / 4),
          decoration: BoxDecoration(
            color: context.colors.surfaceColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Transform.rotate(
            angle: -math.pi / 4,
            child: Icon(
              CocktailMeIcons.logo,
              color: context.colors.primaryColor,
              size: size,
            ),
          ),
        ),
      ),
    );
  }
}
