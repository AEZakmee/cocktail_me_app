import 'ingredient_icon.dart';

class Ingredient {
  Ingredient({
    required this.id,
    required this.title,
    required this.icon,
  });

  final String id;
  final String title;
  final IngredientIcon icon;
}
