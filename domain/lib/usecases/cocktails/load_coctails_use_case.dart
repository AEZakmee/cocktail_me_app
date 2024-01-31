import '../../repositories/cocktails_repository.dart';

class LoadCocktailsUseCase {
  LoadCocktailsUseCase({
    required CocktailsRepository cocktailsRepo,
  }) : _cocktailsRepo = cocktailsRepo;

  final CocktailsRepository _cocktailsRepo;

  Future<bool> call() => _cocktailsRepo.loadCocktails();
}
