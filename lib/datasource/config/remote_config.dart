import 'dart:convert';
import 'dart:developer';

import 'package:firebase_remote_config/firebase_remote_config.dart';

import '../../../app/constants/remote_config_consts.dart';
import '../assets/cocktails/cocktails_asset_client.dart';

class RemoteConfig {
  RemoteConfig({
    required FirebaseRemoteConfig firebaseRemoteConfig,
    required CocktailsAssetClient cocktailsAssetClient,
  })  : _firebaseRemoteConfig = firebaseRemoteConfig,
        _cocktailsAssetClient = cocktailsAssetClient;

  final FirebaseRemoteConfig _firebaseRemoteConfig;
  final CocktailsAssetClient _cocktailsAssetClient;

  bool initialised = false;

  Future<void> init() async {
    if (initialised) {
      log('Firebase remote config already initialised');
      return;
    }

    await _firebaseRemoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: const Duration(days: 1),
      ),
    );
    await _setDefaults();
    await _firebaseRemoteConfig.fetchAndActivate();

    initialised = true;
  }

  Future<void> _setDefaults() async {
    final cocktails = await _cocktailsAssetClient.readString();
    await _firebaseRemoteConfig.setDefaults({
      RemoteConfigConsts.cocktails: cocktails,
    });
  }

  Map<String, dynamic> getJson(String key) => jsonDecode(
        _firebaseRemoteConfig.getString(key),
      ) as Map<String, dynamic>;

  String getString(String key) => _firebaseRemoteConfig.getString(key);

  int getInt(String key) => _firebaseRemoteConfig.getInt(key);

  double getDouble(String key) => _firebaseRemoteConfig.getDouble(key);

  bool getBool(String key) => _firebaseRemoteConfig.getBool(key);
}
