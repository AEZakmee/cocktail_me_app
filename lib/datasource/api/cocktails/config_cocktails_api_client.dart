import '../../../app/di/config.dart';
import '../../models/cocktail_response.dart';
import 'cocktails_api_client.dart';

class ConfigCocktailsApiClient implements CocktailsApiClient {
  ConfigCocktailsApiClient({
    required RemoteConfigReader remoteConfigReader,
  }) : _remoteConfigReader = remoteConfigReader;

  final RemoteConfigReader _remoteConfigReader;

  @override
  Future<List<CocktailResponse>> fetchCocktails() async {
    final data = _remoteConfigReader.cocktailsMap;
    return data.map(CocktailResponse.fromJson).toList();
  }
}
