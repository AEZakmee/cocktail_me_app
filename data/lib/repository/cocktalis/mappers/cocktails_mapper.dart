import 'package:domain/model/cocktail/cocktail.dart';
import 'package:domain/model/cocktail/cocktail_category.dart';
import 'package:domain/model/cocktail/cocktail_image.dart';
import 'package:domain/model/cocktail/cocktail_ingridient.dart';
import 'package:domain/model/cocktail/cocktail_strength.dart';

import '../../../datasource/models/cocktail/cocktail_category_response.dart';
import '../../../datasource/models/cocktail/cocktail_image_response.dart';
import '../../../datasource/models/cocktail/cocktail_ingridient_response.dart';
import '../../../datasource/models/cocktail/cocktail_response.dart';
import '../../../datasource/models/cocktail/cocktail_strength_response.dart';

extension CocktailMapper on CocktailResponse {
  Cocktail toDomain() {
    return Cocktail(
      id: id,
      title: title ?? '',
      description: description ?? '',
      category: category?.toDomain() ?? CocktailCategory.cocktail,
      strength: strength?.toDomain() ?? CocktailStrength.moderate,
      glass: glass ?? '',
      rating: rating ?? 0,
      image: image?.toDomain() ?? CocktailImage.empty(),
      instructions: instructions ?? [],
      ingredients: (ingredients ?? [])
          .map((ingredient) => ingredient.toDomain())
          .toList(),
    );
  }
}

extension IngredientMapper on CocktailIngredientResponse {
  CocktailIngredient toDomain() {
    return CocktailIngredient(
      id: id,
      quantity: quantity ?? '',
    );
  }
}

extension CocktailImageMapper on CocktailImageResponse {
  CocktailImage toDomain() {
    return CocktailImage(
      type: type ?? '',
      url: url ?? '',
    );
  }
}

extension CocktailCategoryMapper on CocktailCategoryResponse {
  CocktailCategory toDomain() {
    return switch (this) {
      CocktailCategoryResponse.cocktail => CocktailCategory.cocktail,
      CocktailCategoryResponse.shot => CocktailCategory.shot,
      CocktailCategoryResponse.ordinary => CocktailCategory.ordinary
    };
  }
}

extension CocktailStrengthMapper on CocktailStrengthResponse {
  CocktailStrength toDomain() {
    return switch (this) {
      CocktailStrengthResponse.light => CocktailStrength.light,
      CocktailStrengthResponse.moderate => CocktailStrength.moderate,
      CocktailStrengthResponse.strong => CocktailStrength.strong,
      CocktailStrengthResponse.nonalcoholic => CocktailStrength.nonalcoholic
    };
  }
}
