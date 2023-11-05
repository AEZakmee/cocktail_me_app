import '../../../app/model/cocktail/cocktail.dart';
import '../../../app/model/handler/data_response.dart';
import '../../../repository/cocktalis/cocktails_repo.dart';

class FetchCocktailsUseCase {
  FetchCocktailsUseCase({
    required CocktailsRepository cocktailsRepo,
  }) : _cocktailsRepo = cocktailsRepo;

  final CocktailsRepository _cocktailsRepo;

  Future<DataResponse<List<Cocktail>>> call() =>
      _cocktailsRepo.fetchCocktailsData();
}
