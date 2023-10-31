import 'dart:ui';

import '../../app/model/theme_type.dart';

extension BrightnessMapper on Brightness {
  ThemeType toThemeType() => switch (this) {
        Brightness.light => ThemeType.light,
        Brightness.dark => ThemeType.dark,
      };
}

extension ThemeTypeMapper on ThemeType {
  Brightness toBrightness() => switch (this) {
        ThemeType.light => Brightness.light,
        ThemeType.dark => Brightness.dark,
      };
}
