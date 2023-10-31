import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  AppColors({
    required this.primaryColor,
    required this.secondaryColor,
    required this.errorColor,
    required this.surfaceColor,
    required this.accentColor,
    required this.textColor,
  });

  factory AppColors.dark() => AppColors(
        primaryColor: const Color(0xFF491552),
        secondaryColor: const Color(0xFF4ba4c9),
        accentColor: const Color(0xFFFFD166),
        surfaceColor: const Color(0xFF788787),
        errorColor: const Color(0xFF911414),
        textColor: Colors.white,
      );

  final Color? primaryColor;
  final Color? secondaryColor;
  final Color? accentColor;

  final Color? surfaceColor;

  final Color? errorColor;
  final Color? textColor;

  @override
  ThemeExtension<AppColors> copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? errorColor,
    Color? surfaceColor,
    Color? accentColor,
    Color? textColor,
  }) =>
      AppColors(
        primaryColor: primaryColor ?? this.primaryColor,
        secondaryColor: secondaryColor ?? this.secondaryColor,
        accentColor: accentColor ?? this.accentColor,
        surfaceColor: surfaceColor ?? this.surfaceColor,
        errorColor: errorColor ?? this.errorColor,
        textColor: textColor ?? this.textColor,
      );

  @override
  ThemeExtension<AppColors> lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t),
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t),
      accentColor: Color.lerp(accentColor, other.accentColor, t),
      surfaceColor: Color.lerp(surfaceColor, other.surfaceColor, t),
      errorColor: Color.lerp(errorColor, other.errorColor, t),
      textColor: Color.lerp(textColor, other.textColor, t),
    );
  }
}
