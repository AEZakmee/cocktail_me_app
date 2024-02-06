import 'package:domain/model/cocktail/cocktail_category.dart';
import 'package:domain/model/cocktail/cocktail_strength.dart';
import 'package:flutter/cupertino.dart';

class GlobalFilterProvider extends ChangeNotifier {
  List<CocktailCategory> _categories = List.from(CocktailCategory.values);
  List<CocktailStrength> _strengths = List.from(CocktailStrength.values);
  List<String> _ingredients = [];

  List<CocktailCategory> get categories => _categories;
  List<CocktailStrength> get strengths => _strengths;
  List<String> get ingredients => _ingredients;

  void resetFilters() {
    _categories = List.from(CocktailCategory.values);
    _strengths = List.from(CocktailStrength.values);
    _ingredients = [];

    notifyListeners();
  }

  void updateCategory(CocktailCategory category) {
    if (_categories.contains(category)) {
      _categories.remove(category);
    } else {
      _categories.add(category);
    }
    notifyListeners();
  }

  void updateStrength(CocktailStrength strength) {
    if (_strengths.contains(strength)) {
      _strengths.remove(strength);
    } else {
      _strengths.add(strength);
    }
    notifyListeners();
  }

  void updateIngredients(String ingredientId) {
    if (_ingredients.contains(ingredientId)) {
      _ingredients.remove(ingredientId);
    } else {
      _ingredients.add(ingredientId);
    }
    notifyListeners();
  }
}
