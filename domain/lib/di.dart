import 'package:core/di/locator.dart';

import 'services/localization_service.dart';
import 'services/theme_service.dart';
import 'usecases/cocktails/fetch_coctails_use_case.dart';

Future<void> registerDomain() async {
  locator
    ..registerLazySingleton(
      () => ThemeService(
        settingsRepository: locator(),
      ),
    )
    ..registerLazySingleton(
      () => LocalizationService(
        settingsRepository: locator(),
      ),
    )

    //Use Cases
    ..registerLazySingleton(
      () => FetchCocktailsUseCase(
        cocktailsRepo: locator(),
      ),
    );
}
