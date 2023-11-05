import '../../models/cocktail_response.dart';
import 'cocktails_api_client.dart';

class RemoteCocktailsApiClient implements CocktailsApiClient {
  @override
  Future<List<CocktailResponse>> fetchCocktails() async {
    throw UnimplementedError();
  }
}
