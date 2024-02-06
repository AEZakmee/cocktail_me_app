import 'package:domain/services/remote_config.dart';

import '../../models/ingredient/ingredient_response.dart';
import 'ingredients_api_client.dart';

class ConfigIngredientsApiClient implements IngredientsApiClient {
  ConfigIngredientsApiClient({
    required RemoteConfig remoteConfig,
  }) : _remoteConfig = remoteConfig;

  final RemoteConfig _remoteConfig;

  @override
  Future<List<IngredientResponse>> fetchIngredients() async {
    final data = _remoteConfig.ingredientsMap;
    return data.map(IngredientResponse.fromJson).toList();
  }
}
