import '../../assets/cocktails/cocktails_asset_client.dart';
import '../../models/cocktail/cocktail_response.dart';
import 'cocktails_api_client.dart';

class LocalCocktailsApiClient implements CocktailsApiClient {
  LocalCocktailsApiClient({
    required CocktailsAssetClient cocktailsAssetClient,
  }) : _cocktailsAssetClient = cocktailsAssetClient;

  final CocktailsAssetClient _cocktailsAssetClient;

  @override
  Future<List<CocktailResponse>> fetchCocktails() async {
    final data = await _cocktailsAssetClient.readJsonList();
    return data.map(CocktailResponse.fromJson).toList();
  }
}
