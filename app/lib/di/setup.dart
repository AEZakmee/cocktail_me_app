import 'package:data/constants/storage_consts.dart';
import 'package:data/datasource/api/cocktails/cocktails_api_client.dart';
import 'package:data/datasource/api/cocktails/config_cocktails_api_client.dart';
import 'package:data/datasource/api/cocktails/local_cocktails_api_client.dart';
import 'package:data/datasource/assets/cocktails/cocktails_asset_client.dart';
import 'package:data/datasource/cache/settings/settings_cache_client.dart';
import 'package:data/repository/cocktalis/cocktails_repo.dart';
import 'package:data/repository/handler/request_handler.dart';
import 'package:data/repository/settings/settings_repo.dart';
import 'package:data/storage.dart';
import 'package:domain/constants/remote_config_consts.dart';
import 'package:domain/model/cocktails_api_type.dart';
import 'package:domain/repositories/cocktails_repository.dart';
import 'package:domain/repositories/settings_repository.dart';
import 'package:domain/services/auth.dart';
import 'package:domain/services/localization_service.dart';
import 'package:domain/services/remote_config.dart';
import 'package:domain/services/theme_service.dart';
import 'package:domain/usecases/cocktails/fetch_coctails_use_case.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:hive/hive.dart';
import 'package:presentation/app/main_viewmodel.dart';
import 'package:presentation/home/home_viewmodel.dart';
import 'package:presentation/login/signin_viewmodel.dart';
import 'package:presentation/signup/signup_viewmodel.dart';

import '../firebase_options.dart';
import 'locator.dart';

Future<void> setupDependencies() async {
  await setupStorage();

  final app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  locator
    ..registerLazySingleton(() => app)
    ..registerLazySingleton(
      () => FirebaseRemoteConfig.instanceFor(
        app: locator(),
      ),
    )
    ..registerLazySingleton(
      () => FirebaseAuth.instanceFor(
        app: locator(),
      ),
    )
    ..registerLazySingleton(
      () => FirebaseAnalytics.instanceFor(
        app: locator(),
      ),
    );

  await locator<FirebaseRemoteConfig>().setConfigSettings(
    RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(hours: 12),
    ),
  );
  await locator<FirebaseRemoteConfig>().setDefaults({
    RemoteConfigConsts.cocktailsApiType: CocktailsApiType.local.id,
  });
  await locator<FirebaseRemoteConfig>().fetchAndActivate();

  locator

    /// Asset Clients
    ..registerLazySingleton(
      CocktailsAssetClient.new,
    )

    ///Api Clients
    ..registerLazySingleton<CocktailsApiClient>(() {
      return switch (locator<RemoteConfig>().cocktailsApiType) {
        CocktailsApiType.local => LocalCocktailsApiClient(
            cocktailsAssetClient: locator(),
          ),
        CocktailsApiType.config => ConfigCocktailsApiClient(
            remoteConfig: locator(),
          )
      };
    })

    ///Cache Clients
    ..registerLazySingleton(
      () => SettingsCacheClient(
        box: Hive.box(StorageConsts.hiveStorageKey),
      ),
    )

    ///Repositories
    ..registerLazySingleton(RequestHandler.new)
    ..registerLazySingleton<CocktailsRepository>(
      () => CocktailsRepositoryImpl(
        cocktailsApiClient: locator(),
        requestHandler: locator(),
      ),
    )
    ..registerLazySingleton<SettingsRepository>(
      () => SettingsRepositoryImpl(
        settingsCacheClient: locator(),
      ),
    )

    ///Services
    ..registerLazySingleton(
      () => Auth(
        firebaseAuth: locator(),
      ),
    )
    ..registerLazySingleton(
      () => RemoteConfig(
        firebaseRemoteConfig: locator(),
      ),
    )
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

    ///Use Cases
    ..registerLazySingleton(
      () => FetchCocktailsUseCase(
        cocktailsRepo: locator(),
      ),
    )

    ///View Models
    ..registerFactory(
      () => MainViewModel(
        localizationService: locator(),
        themeService: locator(),
        auth: locator(),
      ),
    )
    ..registerFactory(
      () => HomeViewModel(
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
