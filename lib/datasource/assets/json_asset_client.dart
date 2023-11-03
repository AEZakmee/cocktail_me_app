import 'dart:convert';

import 'package:flutter/services.dart';

abstract class JsonAssetClient {
  abstract String path;

  Future<String> readString() async {
    return rootBundle.loadString(path);
  }

  Future<Map<String, dynamic>> readMap() async {
    return readString().then(
      (jsonStr) => jsonDecode(jsonStr) as Map<String, dynamic>,
    );
  }
}
