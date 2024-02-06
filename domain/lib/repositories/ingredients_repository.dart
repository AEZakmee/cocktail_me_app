import '../model/handler/data_response.dart';
import '../model/ingredient/ingredient.dart';

abstract interface class IngredientsRepository {
  Future<DataResponse<Iterable<Ingredient>>> fetchIngredients({
    bool readCache = true,
  });
}
