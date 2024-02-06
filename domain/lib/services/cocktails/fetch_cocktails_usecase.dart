import 'package:utils/let_extension.dart';

import '../../model/cocktail/cocktail.dart';
import '../../model/cocktail/cocktail_category.dart';
import '../../model/cocktail/cocktail_strength.dart';
import '../../model/handler/data_response.dart';
import '../../repositories/cocktails_repository.dart';
import '../../utils/extensions.dart';

class FetchCocktailsUseCase {
  FetchCocktailsUseCase({
    required CocktailsRepository cocktailsRepository,
  }) : _cocktailsRepository = cocktailsRepository;

  final CocktailsRepository _cocktailsRepository;

  Future<DataResponse<Iterable<Cocktail>>> call({
    List<CocktailCategory>? categoryFilter,
    List<CocktailStrength>? strengthFilter,
  }) async {
    final response = await _cocktailsRepository.fetchCocktails();

    return response.mapData((data) {
      categoryFilter?.let((categories) {
        data = data.where(
          (cocktail) => categories.contains(cocktail.category),
        );
      });

      strengthFilter?.let((strengths) {
        data = data.where(
          (cocktail) => strengths.contains(cocktail.strength),
        );
      });

      return data;
    });
  }
}
