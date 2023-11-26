import 'package:domain/services/remote_config.dart';

import '../../models/cocktail_response.dart';
import 'cocktails_api_client.dart';

class ConfigCocktailsApiClient implements CocktailsApiClient {
  ConfigCocktailsApiClient({
    required RemoteConfig remoteConfig,
  }) : _remoteConfig = remoteConfig;

  final RemoteConfig _remoteConfig;

  @override
  Future<List<CocktailResponse>> fetchCocktails() async {
    final data = _remoteConfig.cocktailsMap;
    return data.map(CocktailResponse.fromJson).toList();
  }
}
