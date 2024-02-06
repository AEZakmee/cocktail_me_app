import 'package:utils/let_extension.dart';

import '../../model/handler/data_response.dart';
import '../../model/ingredient/ingredient.dart';
import '../../repositories/ingredients_repository.dart';
import '../../utils/extensions.dart';

class FetchIngredientsUseCase {
  FetchIngredientsUseCase({
    required IngredientsRepository ingredientsRepository,
  }) : _ingredientsRepository = ingredientsRepository;

  final IngredientsRepository _ingredientsRepository;

  Future<DataResponse<Iterable<Ingredient>>> call({
    List<String>? filterIds,
  }) async {
    final response = await _ingredientsRepository.fetchIngredients();

    return response.mapData((data) {
      filterIds?.let((ids) {
        data = data.where((element) => ids.contains(element.id));
      });

      return data;
    });
  }
}
