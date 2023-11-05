import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';

import '../constants/remote_config_consts.dart';
import '../model/cocktails_api_type.dart';

class RemoteConfigReader {
  RemoteConfigReader({
    required FirebaseRemoteConfig firebaseRemoteConfig,
  }) : _firebaseRemoteConfig = firebaseRemoteConfig;

  final FirebaseRemoteConfig _firebaseRemoteConfig;

  CocktailsApiType get cocktailsApiType {
    final typeId = _firebaseRemoteConfig.getInt(
      RemoteConfigConsts.cocktailsApiType,
    );
    return CocktailsApiType.getType(typeId);
  }

  List<Map<String, dynamic>> get cocktailsMap {
    final data = _firebaseRemoteConfig.getString(
      RemoteConfigConsts.cocktails,
    );
    final decodedList = jsonDecode(data) as List<dynamic>;
    return decodedList.map((e) => e as Map<String, dynamic>).toList();
  }
}
