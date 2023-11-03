import 'cocktail.dart';

class CocktailsData {
  const CocktailsData({
    required this.cocktails,
  });

  factory CocktailsData.empty() => const CocktailsData(cocktails: []);

  final List<Cocktail> cocktails;
}
