import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';

import '../constants/remote_config_consts.dart';
import '../model/api_type.dart';

class RemoteConfig {
  RemoteConfig({
    required FirebaseRemoteConfig firebaseRemoteConfig,
  }) : _firebaseRemoteConfig = firebaseRemoteConfig;

  final FirebaseRemoteConfig _firebaseRemoteConfig;

  ApiType get apiType {
    final typeId = _firebaseRemoteConfig.getInt(
      RemoteConfigConsts.apiType,
    );
    return ApiType.getType(typeId);
  }

  List<Map<String, dynamic>> get cocktailsMap {
    final data = _firebaseRemoteConfig.getString(
      RemoteConfigConsts.cocktails,
    );
    final decodedList = jsonDecode(data) as List<dynamic>;
    return decodedList.map((e) => e as Map<String, dynamic>).toList();
  }

  List<Map<String, dynamic>> get ingredientsMap {
    final data = _firebaseRemoteConfig.getString(
      RemoteConfigConsts.ingredients,
    );
    final decodedList = jsonDecode(data) as List<dynamic>;
    return decodedList.map((e) => e as Map<String, dynamic>).toList();
  }
}
