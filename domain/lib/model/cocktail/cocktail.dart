import 'cocktail_category.dart';
import 'cocktail_image.dart';
import 'cocktail_ingridient.dart';
import 'cocktail_strength.dart';

class Cocktail {
  Cocktail({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.strength,
    required this.glass,
    required this.rating,
    required this.image,
    required this.instructions,
    required this.ingredients,
  });

  final String id;
  final String title;
  final String description;
  final CocktailCategory category;
  final CocktailStrength strength;
  final String glass;
  final double rating;
  final CocktailImage image;
  final List<String> instructions;
  final List<CocktailIngredient> ingredients;
}
