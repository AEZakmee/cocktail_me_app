import 'package:flutter/material.dart';

import '../../../../utils/extensions.dart';
import '../../../../widgets/custom_cached_image.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    required this.imageUrl,
    required this.title,
    this.onFavoriteClick,
    super.key,
  });

  final String imageUrl;
  final String title;
  final Function? onFavoriteClick;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomCachedImage(
          url: imageUrl,
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  context.colors.primaryColor!,
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  context.colors.primaryColor!,
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
