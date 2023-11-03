import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

import '../../datasource/api/api_requests.dart';
import '../../datasource/api/interceptors/error_interceptor.dart';
import '../../datasource/assets/cocktails/cocktails_asset_client.dart';
import '../../datasource/cache/settings/settings_cache_client.dart';
import '../../datasource/config/cocktails/cocktails_data_client.dart';
import '../../datasource/config/remote_config.dart';
import '../../domain/services/auth_service.dart';
import '../../domain/services/localization_service.dart';
import '../../domain/services/theme_service.dart';
import '../../domain/usecases/cocktails/get_coctails_use_case.dart';
import '../../presentation/app/main_viewmodel.dart';
import '../../presentation/home/home_viewmodel.dart';
import '../../presentation/welcome/welcome_viewmodel.dart';
import '../../repository/cocktalis/cocktails_repo.dart';
import '../../repository/handler/request_handler.dart';
import '../../repository/settings/settings_repo.dart';
import '../constants/storage_consts.dart';

final locator = GetIt.instance;

void setupLocator(FirebaseApp app) => locator

  ///Firebase
  ..registerLazySingleton(
    () => app,
  )
  ..registerLazySingleton(
    () => FirebaseAuth.instanceFor(
      app: locator(),
    ),
  )
  ..registerLazySingleton(
    () => FirebaseRemoteConfig.instanceFor(
      app: locator(),
    ),
  )

  ///Api
  ..registerLazySingleton(
    () => Dio(
      BaseOptions(
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        connectTimeout: const Duration(seconds: 30),

        ///Should be loaded from env
        baseUrl: 'https://www.thecocktaildb.com/api/json/v1/1/',
      ),
    ),
  )
  ..registerLazySingleton(
    () => RetryInterceptor(
      dio: locator(),
      logPrint: log,
      retryDelays: const [
        Duration(seconds: 1),
        Duration(seconds: 2),
        Duration(seconds: 3),
      ],
      retryableExtraStatuses: {401, 403},
    ),
  )
  ..registerLazySingleton(ErrorInterceptor.new)
  ..registerLazySingleton(
    () => ApiRequests(
      dio: locator<Dio>()
        ..interceptors.add(
          locator<ErrorInterceptor>(),
        )
        ..interceptors.add(
          locator<RetryInterceptor>(),
        ),
    ),
  )

  ///Asset Clients
  ..registerLazySingleton(
    CocktailsAssetClient.new,
  )

  ///Cache Clients
  ..registerLazySingleton(
    () => SettingsCacheClient(
      box: Hive.box(StorageConsts.hiveStorageKey),
    ),
  )

  ///Config Clients
  ..registerLazySingleton(
    () => RemoteConfig(
      firebaseRemoteConfig: locator(),
      cocktailsAssetClient: locator(),
    ),
  )
  ..registerLazySingleton(
    () => CocktailsConfigClient(
      config: locator(),
    ),
  )

  ///Repository
  ..registerLazySingleton(RequestHandler.new)
  ..registerLazySingleton(
    () => CocktailsRepository(
      cocktailsConfigClient: locator(),
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
    () => GetCocktailsUseCase(
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
      getCocktailsUseCase: locator(),
      auth: locator(),
    ),
  )
  ..registerFactory(
    () => WelcomeViewModel(
      auth: locator(),
    ),
  );
