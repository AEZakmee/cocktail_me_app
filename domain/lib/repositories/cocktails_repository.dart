import '../model/cocktail/cocktail.dart';
import '../model/handler/data_response.dart';

abstract interface class CocktailsRepository {
  Future<DataResponse<List<Cocktail>>> fetchCocktailsData();
}
