import 'package:domain/model/handler/data_response.dart';
import 'package:domain/model/ingredient/ingredient.dart';
import 'package:domain/repositories/ingredients_repository.dart';
import 'package:utils/let_extension.dart';

import '../../datasource/api/ingredients/ingredients_api_client.dart';
import '../handler/extensions.dart';
import '../handler/request_handler.dart';
import 'mappers/ingredients_mapper.dart';

class IngredientsRepositoryImpl implements IngredientsRepository {
  IngredientsRepositoryImpl({
    required IngredientsApiClient ingredientsApiClient,
    required RequestHandler requestHandler,
  })  : _ingredientsApiClient = ingredientsApiClient,
        _requestHandler = requestHandler;

  final IngredientsApiClient _ingredientsApiClient;
  final RequestHandler _requestHandler;

  Iterable<Ingredient> _ingredients = const [];

  @override
  Future<DataResponse<Iterable<Ingredient>>> fetchIngredients({
    bool readCache = true,
  }) async {
    if (readCache && _ingredients.isNotEmpty) {
      return DataResponse(data: _ingredients);
    }

    final result = await _requestHandler.safeApiCall(
      _ingredientsApiClient.fetchIngredients,
    );

    final response = result.toDataResponse(
      (data) => data.map((e) => e.toDomain()),
    );

    response.data?.let((ingredients) => _ingredients = ingredients);

    return response;
  }
}
