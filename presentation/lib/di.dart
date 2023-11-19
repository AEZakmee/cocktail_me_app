import 'package:core/di/locator.dart';

import 'app/main_viewmodel.dart';
import 'home/home_viewmodel.dart';
import 'login/signin_viewmodel.dart';
import 'signup/signup_viewmodel.dart';

Future<void> registerPresentation() async {
  locator
    ..registerFactory(
      () => MainViewModel(
        localizationService: locator(),
        themeService: locator(),
        auth: locator(),
      ),
    )
    ..registerFactory(
      () => HomeViewModel(
        fetchCocktailsUseCase: locator(),
        auth: locator(),
      ),
    )
    ..registerFactory(
      () => SignInViewModel(
        auth: locator(),
      ),
    )
    ..registerFactory(
      () => SignUpViewModel(
        auth: locator(),
      ),
    );
}
