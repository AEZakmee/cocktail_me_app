import 'package:domain/model/ingredient/ingredient.dart';
import 'package:domain/model/ingredient/ingredient_icon.dart';

import '../../../datasource/models/ingredient/ingredient_icon_response.dart';
import '../../../datasource/models/ingredient/ingredient_response.dart';

extension IngredientMapper on IngredientResponse {
  Ingredient toDomain() {
    return Ingredient(
      id: id,
      title: title ?? '',
      icon: icon?.toDomain() ?? IngredientIcon.other,
    );
  }
}

extension IngredientIconMapper on IngredientIconResponse {
  IngredientIcon toDomain() {
    return switch (this) {
      IngredientIconResponse.bottle => IngredientIcon.bottle,
      IngredientIconResponse.other => IngredientIcon.other,
    };
  }
}
