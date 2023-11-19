import 'package:flutter/material.dart';

import 'app_colors.dart';

const fontFamily = 'Quicksand';

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
          backgroundColor: _colors.surfaceColor,
        ),
        textTheme: _textTheme,
        textSelectionTheme: _textSelectionTheme,
        inputDecorationTheme: _inputDecorationTheme,
        elevatedButtonTheme: _elevatedButtonTheme,
        bottomSheetTheme: _bottomSheetTheme,
        textButtonTheme: _textButtonTheme,
      );

  AppColors get _colors {
    return switch (_brightness) {
      Brightness.light => AppColors.light(),
      Brightness.dark => AppColors.dark(),
    };
  }

  ColorScheme get _colorScheme {
    return switch (_brightness) {
      Brightness.light => const ColorScheme.light().copyWith(
          secondary: _colors.secondaryColor,
          primary: _colors.primaryColor,
          background: _colors.primaryColor,
          error: _colors.errorColor,
          brightness: Brightness.light,
        ),
      Brightness.dark => const ColorScheme.dark().copyWith(
          secondary: _colors.secondaryColor,
          primary: _colors.primaryColor,
          background: _colors.primaryColor,
          error: _colors.errorColor,
          brightness: Brightness.dark,
        ),
    };
  }

  BottomSheetThemeData get _bottomSheetTheme => BottomSheetThemeData(
        backgroundColor: _colors.surfaceColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
      );

  TextSelectionThemeData get _textSelectionTheme => TextSelectionThemeData(
        cursorColor: _colors.surfaceColor,
      );

  InputDecorationTheme get _inputDecorationTheme => InputDecorationTheme(
        filled: true,
        fillColor: _colors.surfaceColor?.withOpacity(0.05),
        prefixIconColor: _colors.primaryColor,
        hintStyle: TextStyle(
          color: _colors.surfaceColor,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: _colors.surfaceColor!.withOpacity(0.5),
            width: 0.5,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(32)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: _colors.surfaceColor!,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(32)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: _colors.surfaceColor!,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(32)),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 8,
        ),
      );

  ElevatedButtonThemeData get _elevatedButtonTheme => ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll<Color?>(
            _colors.surfaceColor,
          ),
          foregroundColor: MaterialStatePropertyAll<Color?>(
            _colors.primaryColor,
          ),
          overlayColor: MaterialStatePropertyAll<Color?>(
            _colors.primaryColor?.withOpacity(0.1),
          ),
          elevation: const MaterialStatePropertyAll<double?>(0),
          textStyle: MaterialStatePropertyAll<TextStyle?>(
            _textTheme.titleLarge,
          ),
          enableFeedback: true,
          minimumSize: const MaterialStatePropertyAll<Size?>(
            Size(double.infinity, 60),
          ),
          shape: MaterialStatePropertyAll<OutlinedBorder?>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
            ),
          ),
        ),
      );

  TextButtonThemeData get _textButtonTheme => TextButtonThemeData(
        style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll<Color?>(
            Colors.transparent,
          ),
          foregroundColor: MaterialStatePropertyAll<Color?>(
            _colors.textColor,
          ),
          elevation: const MaterialStatePropertyAll<double?>(0),
          textStyle: MaterialStatePropertyAll<TextStyle?>(
            _textTheme.titleLarge,
          ),
          minimumSize: const MaterialStatePropertyAll<Size?>(
            Size(double.infinity, 60),
          ),
          shape: MaterialStatePropertyAll<OutlinedBorder?>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
              side: BorderSide(
                color: _colors.textColor!.withOpacity(0.2),
              ),
            ),
          ),
        ),
      );

  TextTheme get _textTheme => TextTheme(
        displayLarge: const TextStyle(
          fontSize: 48,
          fontWeight: FontWeight.w700,
          fontFamily: fontFamily,
        ),
        displayMedium: const TextStyle(
          fontSize: 38,
          fontWeight: FontWeight.w700,
          fontFamily: fontFamily,
        ),
        displaySmall: const TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w600,
          fontFamily: fontFamily,
        ),
        labelLarge: const TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.w700,
          fontFamily: fontFamily,
        ),
        labelMedium: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w500,
          fontFamily: fontFamily,
        ),
        labelSmall: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          fontFamily: fontFamily,
        ),
        titleLarge: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          fontFamily: fontFamily,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: _colors.surfaceColor,
          fontFamily: fontFamily,
        ),
        titleSmall: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontFamily: fontFamily,
        ),
        bodyLarge: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          fontFamily: fontFamily,
        ),
        bodyMedium: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          fontFamily: fontFamily,
        ),
        bodySmall: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          fontFamily: fontFamily,
        ),
      );
}
