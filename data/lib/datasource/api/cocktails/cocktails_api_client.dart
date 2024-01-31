import '../../models/cocktail/cocktail_response.dart';

abstract interface class CocktailsApiClient {
  Future<List<CocktailResponse>> fetchCocktails();
}
