import 'package:flutter/material.dart';

import '../constants/radius_const.dart';
import '../constants/spacing_const.dart';
import 'app_colors.dart';

const fontFamily = 'Roboto';

class AppTheme {
  AppTheme({
    required Brightness brightness,
  }) : _brightness = brightness;

  final Brightness _brightness;

  ThemeData get theme => ThemeData(
        fontFamily: fontFamily,
        extensions: <ThemeExtension<dynamic>>[
          _colors,
        ],
        primaryColor: _colors.primaryColor,
        colorScheme: _colorScheme,
        appBarTheme: AppBarTheme(
          backgroundColor: _colors.secondaryColor,
        ),
        textTheme: _textTheme,
        textSelectionTheme: _textSelectionTheme,
        inputDecorationTheme: _inputDecorationTheme,
        elevatedButtonTheme: _elevatedButtonTheme,
      );

  AppColors get _colors {
    return switch (_brightness) {
      Brightness.light => AppColors.dark(),
      Brightness.dark => AppColors.dark(),
    };
  }

  ColorScheme get _colorScheme {
    return switch (_brightness) {
      Brightness.light => const ColorScheme.light().copyWith(
          secondary: _colors.secondaryColor,
          primary: _colors.primaryColor,
          background: _colors.surfaceColor,
          error: _colors.errorColor,
          brightness: Brightness.light,
        ),
      Brightness.dark => const ColorScheme.dark().copyWith(
          secondary: _colors.secondaryColor,
          primary: _colors.primaryColor,
          background: _colors.surfaceColor,
          error: _colors.errorColor,
          brightness: Brightness.dark,
        ),
    };
  }

  TextSelectionThemeData get _textSelectionTheme => TextSelectionThemeData(
        cursorColor: _colors.secondaryColor,
      );

  InputDecorationTheme get _inputDecorationTheme => InputDecorationTheme(
        filled: true,
        fillColor: _colors.primaryColor?.withOpacity(0.2),
        prefixIconColor: _colors.textColor,
        hintStyle: TextStyle(
          color: _colors.textColor?.withOpacity(0.5),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: _colors.primaryColor!,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(RadiusConst.xl)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: _colors.primaryColor!,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(RadiusConst.xl)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: _colors.primaryColor!,
            width: 2,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(RadiusConst.xl)),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: SpacingConst.md,
          horizontal: SpacingConst.xs,
        ),
      );

  ElevatedButtonThemeData get _elevatedButtonTheme => ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll<Color?>(
            _colors.primaryColor,
          ),
          foregroundColor: MaterialStatePropertyAll<Color?>(_colors.textColor),
          elevation: const MaterialStatePropertyAll<double?>(0),
          shadowColor: const MaterialStatePropertyAll<Color?>(
            Colors.transparent,
          ),
          textStyle: MaterialStatePropertyAll<TextStyle?>(
            _textTheme.titleLarge,
          ),
          minimumSize: const MaterialStatePropertyAll<Size?>(
            Size(double.infinity, 64),
          ),
          shape: MaterialStatePropertyAll<OutlinedBorder?>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(RadiusConst.xl),
            ),
          ),
        ),
      );

  TextTheme get _textTheme => const TextTheme(
        displayLarge: TextStyle(
          fontSize: 48,
          fontWeight: FontWeight.w700,
          fontFamily: fontFamily,
        ),
        displayMedium: TextStyle(
          fontSize: 42,
          fontWeight: FontWeight.w700,
          fontFamily: fontFamily,
        ),
        displaySmall: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w600,
          fontFamily: fontFamily,
        ),
        labelLarge: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w700,
          fontFamily: fontFamily,
        ),
        labelMedium: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.w500,
          fontFamily: fontFamily,
        ),
        labelSmall: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w500,
          fontFamily: fontFamily,
        ),
        titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          fontFamily: fontFamily,
        ),
        titleMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          fontFamily: fontFamily,
        ),
        titleSmall: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          fontFamily: fontFamily,
        ),
        bodyLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontFamily: fontFamily,
        ),
        bodyMedium: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          fontFamily: fontFamily,
        ),
        bodySmall: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          fontFamily: fontFamily,
        ),
      );
}
