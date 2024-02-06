import '../../models/ingredient/ingredient_response.dart';

abstract interface class IngredientsApiClient {
  Future<List<IngredientResponse>> fetchIngredients();
}
