import '../model/cocktail/cocktail.dart';

abstract interface class CocktailsRepository {
  Future<bool> loadCocktails();
  Iterable<Cocktail> get cocktails;
}
