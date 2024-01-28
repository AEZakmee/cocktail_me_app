import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:utils/let_extension.dart';

class CustomCachedImage extends StatelessWidget {
  const CustomCachedImage({
    required this.url,
    this.hash,
    this.borderRadius,
    this.shadow,
    this.shape = BoxShape.rectangle,
    this.fallbackWidget,
    super.key,
  });

  final String url;
  final String? hash;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? shadow;
  final BoxShape shape;
  final Widget? fallbackWidget;

  @override
  Widget build(BuildContext context) => CachedNetworkImage(
        imageUrl: url,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            boxShadow: shadow,
            borderRadius: borderRadius,
            shape: shape,
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        placeholder: (_, __) =>
            hash?.let((hash) {
              return BlurHash(hash: hash);
            }) ??
            const SizedBox.shrink(),
        errorWidget: (_, __, ___) => fallbackWidget ?? const SizedBox.shrink(),
      );
}
