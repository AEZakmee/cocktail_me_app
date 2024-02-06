import '../../assets/ingredients/ingredients_asset_client.dart';
import '../../models/ingredient/ingredient_response.dart';
import 'ingredients_api_client.dart';

class LocalIngredientsApiClient implements IngredientsApiClient {
  LocalIngredientsApiClient({
    required IngredientsAssetClient ingredientsAssetClient,
  }) : _ingredientsAssetClient = ingredientsAssetClient;

  final IngredientsAssetClient _ingredientsAssetClient;

  @override
  Future<List<IngredientResponse>> fetchIngredients() async {
    final data = await _ingredientsAssetClient.readJsonList();
    return data.map(IngredientResponse.fromJson).toList();
  }
}
