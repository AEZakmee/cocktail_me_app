import 'package:utils/let_extension.dart';

import '../../model/cocktail/cocktail.dart';
import '../../model/cocktail/cocktail_category.dart';
import '../../model/cocktail/cocktail_strength.dart';
import '../../repositories/cocktails_repository.dart';

class CocktailService {
  CocktailService({
    required CocktailsRepository cocktailsRepo,
  }) : _cocktailsRepo = cocktailsRepo;

  final CocktailsRepository _cocktailsRepo;

  Iterable<Cocktail> filterCocktails({
    List<CocktailCategory>? categoryFilter,
    List<CocktailStrength>? strengthFilter,
  }) {
    Iterable<Cocktail> cocktails = _cocktailsRepo.cocktails;

    categoryFilter?.let((categories) {
      cocktails = cocktails.where(
        (cocktail) => categories.contains(cocktail.category),
      );
    });

    strengthFilter?.let((strengths) {
      cocktails = cocktails.where(
        (cocktail) => strengths.contains(cocktail.strength),
      );
    });

    return cocktails;
  }
}
