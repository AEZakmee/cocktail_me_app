import '../../../app/model/cocktail/cocktail.dart';
import '../../../repository/cocktalis/cocktails_repo.dart';

class GetCocktailsUseCase {
  GetCocktailsUseCase({
    required CocktailsRepository cocktailsRepo,
  }) : _cocktailsRepo = cocktailsRepo;

  final CocktailsRepository _cocktailsRepo;

  List<Cocktail> call() => _cocktailsRepo.cocktails;
}
