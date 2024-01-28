import 'package:flutter/material.dart';

import '../utils/extensions.dart';
import 'custom_cached_image.dart';

class AppCircleAvatar extends StatelessWidget {
  const AppCircleAvatar({
    required this.imageUrl,
    required this.username,
    super.key,
  });

  final String imageUrl;
  final String username;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: context.colors.surfaceColor,
      radius: 25,
      child: CircleAvatar(
        radius: 23,
        child: CustomCachedImage(
          url: imageUrl,
          shape: BoxShape.circle,
          fallbackWidget: DecoratedBox(
            decoration: BoxDecoration(
              color: context.colors.accentColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(username.parsePersonTwoCharactersName()),
            ),
          ),
        ),
      ),
    );
  }
}
