import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  AppColors({
    required this.primaryColor,
    required this.primaryAccentColor,
    required this.secondaryColor,
    required this.errorColor,
    required this.surfaceColor,
    required this.accentColor,
    required this.textColor,
  });

  factory AppColors.dark() => AppColors(
        primaryColor: const Color(0xFF491552),
        primaryAccentColor: const Color(0xFF38173E),
        secondaryColor: const Color(0xFF4ba4c9),
        accentColor: const Color(0xFFFFD166),
        surfaceColor: Colors.white,
        errorColor: const Color(0xFF911414),
        textColor: Colors.black,
      );

  factory AppColors.light() => AppColors(
        primaryColor: const Color(0xFFFF416F),
        primaryAccentColor: const Color(0xFFFF8277),
        secondaryColor: const Color(0xFF4ba4c9),
        accentColor: const Color(0xFFFFD166),
        surfaceColor: Colors.white,
        errorColor: const Color(0xFF911414),
        textColor: Colors.black,
      );

  final Color? primaryColor;
  final Color? primaryAccentColor;

  final Color? secondaryColor;
  final Color? accentColor;

  final Color? surfaceColor;

  final Color? errorColor;
  final Color? textColor;

  @override
  ThemeExtension<AppColors> copyWith({
    Color? primaryColor,
    Color? primaryAccentColor,
    Color? secondaryColor,
    Color? errorColor,
    Color? surfaceColor,
    Color? accentColor,
    Color? textColor,
  }) =>
      AppColors(
        primaryColor: primaryColor ?? this.primaryColor,
        primaryAccentColor: primaryAccentColor ?? this.primaryAccentColor,
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
      primaryAccentColor: Color.lerp(
        primaryAccentColor,
        other.primaryAccentColor,
        t,
      ),
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t),
      accentColor: Color.lerp(accentColor, other.accentColor, t),
      surfaceColor: Color.lerp(surfaceColor, other.surfaceColor, t),
      errorColor: Color.lerp(errorColor, other.errorColor, t),
      textColor: Color.lerp(textColor, other.textColor, t),
    );
  }
}
