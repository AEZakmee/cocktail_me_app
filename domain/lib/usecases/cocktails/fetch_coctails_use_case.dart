import '../../model/cocktail/cocktail.dart';
import '../../model/handler/data_response.dart';
import '../../repositories/cocktails_repository.dart';

class FetchCocktailsUseCase {
  FetchCocktailsUseCase({
    required CocktailsRepository cocktailsRepo,
  }) : _cocktailsRepo = cocktailsRepo;

  final CocktailsRepository _cocktailsRepo;

  Future<DataResponse<List<Cocktail>>> call() =>
      _cocktailsRepo.fetchCocktailsData();
}
