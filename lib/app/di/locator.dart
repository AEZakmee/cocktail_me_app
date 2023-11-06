import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

import '../../datasource/api/cocktails/cocktails_api_client.dart';
import '../../datasource/api/cocktails/config_cocktails_api_client.dart';
import '../../datasource/api/cocktails/local_cocktails_api_client.dart';
import '../../datasource/api/cocktails/remote_cocktails_api_client.dart';
import '../../datasource/assets/cocktails/cocktails_asset_client.dart';
import '../../datasource/cache/settings/settings_cache_client.dart';
import '../../domain/services/auth_service.dart';
import '../../domain/services/localization_service.dart';
import '../../domain/services/theme_service.dart';
import '../../domain/usecases/cocktails/fetch_coctails_use_case.dart';
import '../../firebase_options.dart';
import '../../presentation/app/main_viewmodel.dart';
import '../../presentation/home/home_viewmodel.dart';
import '../../presentation/login/signin_viewmodel.dart';
import '../../repository/cocktalis/cocktails_repo.dart';
import '../../repository/handler/request_handler.dart';
import '../../repository/settings/settings_repo.dart';
import '../constants/remote_config_consts.dart';
import '../constants/storage_consts.dart';
import '../model/cocktails_api_type.dart';
import 'config.dart';

final locator = GetIt.instance;

Future<void> registerDependencies() async {
  final app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //Firebase
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

    ///Config
    ..registerLazySingleton(
      () => RemoteConfigReader(
        firebaseRemoteConfig: locator(),
      ),
    )

    ///Asset Clients
    ..registerLazySingleton(
      CocktailsAssetClient.new,
    )

    ///Api clients
    ..registerLazySingleton<CocktailsApiClient>(() {
      return switch (locator<RemoteConfigReader>().cocktailsApiType) {
        CocktailsApiType.local => LocalCocktailsApiClient(
            cocktailsAssetClient: locator(),
          ),
        CocktailsApiType.config => ConfigCocktailsApiClient(
            remoteConfigReader: locator(),
          ),
        CocktailsApiType.firestore => RemoteCocktailsApiClient()
      };
    })

    ///Cache Clients
    ..registerLazySingleton(
      () => SettingsCacheClient(
        box: Hive.box(StorageConsts.hiveStorageKey),
      ),
    )

    ///Repository
    ..registerLazySingleton(RequestHandler.new)
    ..registerLazySingleton(
      () => CocktailsRepository(
        cocktailsApiClient: locator(),
        requestHandler: locator(),
      ),
    )
    ..registerLazySingleton(
      () => SettingsRepository(
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
    )

    ///Presentation
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
    );
}
