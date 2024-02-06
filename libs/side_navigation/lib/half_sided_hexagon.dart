import 'package:flutter/material.dart';

class HalfSidedHexagon extends StatelessWidget {
  const HalfSidedHexagon({
    required this.icon,
    required this.onTap,
    this.inverted = false,
    this.color,
    this.text,
    super.key,
  });

  final Function() onTap;
  final Color? color;
  final Icon icon;
  final Widget? text;
  final bool inverted;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipPath(
        clipper: inverted
            ? _TrailingHalfSidedHexagonClipper()
            : _LeadingHalfSidedHexagonClipper(),
        child: Material(
          color: color,
          child: InkWell(
            onTap: onTap,
            child: SizedBox(
              height: 200,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    icon,
                    if (text != null)
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 8,
                        ),
                        child: text,
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LeadingHalfSidedHexagonClipper extends CustomClipper<Path> {
  _LeadingHalfSidedHexagonClipper({
    this.cornerRadius = 8.0,
    this.percentage = .25,
  });

  final double cornerRadius;
  final double percentage;

  @override
  Path getClip(Size size) {
    final double topPoint = percentage;
    final double bottomPoint = 1 - percentage;
    return Path()
      ..moveTo(0, 0)
      ..lineTo(
        size.width - cornerRadius,
        (size.height * topPoint) - cornerRadius,
      )
      ..quadraticBezierTo(
        size.width,
        (size.height * topPoint) - cornerRadius / 4,
        size.width,
        (size.height * topPoint) + cornerRadius,
      )
      ..lineTo(
        size.width,
        (size.height * bottomPoint) - cornerRadius,
      )
      ..quadraticBezierTo(
        size.width,
        (size.height * bottomPoint) + cornerRadius / 4,
        size.width - cornerRadius,
        (size.height * bottomPoint) + cornerRadius,
      )
      ..lineTo(0, size.height)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class _TrailingHalfSidedHexagonClipper extends CustomClipper<Path> {
  _TrailingHalfSidedHexagonClipper({
    this.cornerRadius = 8.0,
    this.percentage = .25,
  });

  final double cornerRadius;
  final double percentage;

  @override
  Path getClip(Size size) {
    final double topPoint = percentage;
    final double bottomPoint = 1 - percentage;
    return Path()
      ..moveTo(size.width, 0)
      ..lineTo(
        cornerRadius,
        (size.height * topPoint) - cornerRadius,
      )
      ..quadraticBezierTo(
        0,
        (size.height * topPoint) - cornerRadius / 4,
        0,
        (size.height * topPoint) + cornerRadius,
      )
      ..lineTo(
        0,
        (size.height * bottomPoint) - cornerRadius,
      )
      ..quadraticBezierTo(
        0,
        (size.height * bottomPoint) + cornerRadius / 4,
        cornerRadius,
        (size.height * bottomPoint) + cornerRadius,
      )
      ..lineTo(size.width, size.height)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
