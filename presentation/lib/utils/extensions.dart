import 'dart:async';

import 'package:flutter/material.dart';
import 'package:localizations/generated/app_localizations.dart';

import '../theme/app_colors.dart';
import 'base_viewmodel.dart';

extension AppLocalizationsExtension on BuildContext {
  AppLocalizations get localizations => AppLocalizations.of(this)!;
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  AppColors get colors => theme.extension<AppColors>()!;

  Size get screenSize => MediaQuery.of(this).size;
}

extension DisposeWithStreamSubscriptionExtension<T> on StreamSubscription<T> {
  void disposeWith(BaseViewModel viewModel) {
    viewModel.addDisposable(this);
  }
}

extension BrightnessUtilsMapper on Brightness {
  Brightness opposite() => switch (this) {
        Brightness.light => Brightness.dark,
        Brightness.dark => Brightness.light,
      };
}

extension ProfileName on String {
  String parsePersonTwoCharactersName() {
    final spaceData = split(' ');
    if (spaceData.length >= 2) {
      return spaceData.take(2).map((e) => e[0].toUpperCase()).join();
    }

    final beforeNonLeadingCapitalLetter = RegExp('(?=(?!^)[A-Z])');
    final data = split(beforeNonLeadingCapitalLetter);

    if (data.length >= 2) {
      return data.take(2).map((e) => e[0].toUpperCase()).join();
    }

    return substring(0, 1).toUpperCase();
  }
}
