import 'package:core/di/locator.dart';
import 'package:core/model/cocktails_api_type.dart';
import 'package:core/services/remote_config.dart';
import 'package:hive/hive.dart';

import 'constants/storage_consts.dart';
import 'datasource/api/cocktails/cocktails_api_client.dart';
import 'datasource/api/cocktails/config_cocktails_api_client.dart';
import 'datasource/api/cocktails/local_cocktails_api_client.dart';
import 'datasource/assets/cocktails/cocktails_asset_client.dart';
import 'datasource/cache/settings/settings_cache_client.dart';
import 'repository/cocktalis/cocktails_repo.dart';
import 'repository/handler/request_handler.dart';
import 'repository/settings/settings_repo.dart';
import 'storage.dart';

Future<void> registerData() async {
  await setupStorage();

  locator

    ///Asset Clients
    ..registerLazySingleton(
      CocktailsAssetClient.new,
    )

    ///Api clients
    ..registerLazySingleton<CocktailsApiClient>(() {
      return switch (locator<RemoteConfig>().cocktailsApiType) {
        CocktailsApiType.local => LocalCocktailsApiClient(
            cocktailsAssetClient: locator(),
          ),
        CocktailsApiType.config => LocalCocktailsApiClient(
            cocktailsAssetClient: locator(),
          ),
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
    );
}
