import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

import '../constants/remote_config_consts.dart';
import '../model/cocktails_api_type.dart';
import '../services/auth.dart';
import '../services/remote_config.dart';
import 'locator.dart';

Future<void> registerCore(FirebaseApp app) async {
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

  ///Services
  locator
    ..registerLazySingleton(
      () => Auth(
        firebaseAuth: locator(),
      ),
    )
    ..registerLazySingleton(
      () => RemoteConfig(
        firebaseRemoteConfig: locator(),
      ),
    );
}
