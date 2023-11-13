import 'dart:developer';

import 'package:flutter/material.dart';

import '../home/home_screen.dart';
import '../login/signin_screen.dart';
import '../signup/signup_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class Routes {
  static const String initial = '/';
  static const String home = 'home';
  static const String signup = 'signup';
}

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  log('Navigation: $settings');
  switch (settings.name) {
    case Routes.initial:
      return MaterialPageRoute(
        builder: (_) => const SignInScreen(),
      );
    case Routes.signup:
      return MaterialPageRoute(
        builder: (_) => const SignUpScreen(),
      );
    case Routes.home:
      return MaterialPageRoute(
        builder: (_) => const HomeScreen(),
      );
    default:
      throw const FormatException('Route not found! Check routes again!');
  }
}
