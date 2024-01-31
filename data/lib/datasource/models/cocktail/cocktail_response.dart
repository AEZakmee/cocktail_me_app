import 'package:json_annotation/json_annotation.dart';

import 'cocktail_category_response.dart';
import 'cocktail_image_response.dart';
import 'cocktail_ingridient_response.dart';
import 'cocktail_strength_response.dart';

part 'cocktail_response.g.dart';

@JsonSerializable()
class CocktailResponse {
  CocktailResponse({
    required this.id,
    this.title,
    this.description,
    this.category,
    this.strength,
    this.glass,
    this.rating,
    this.image,
    this.instructions,
    this.ingredients,
  });

  factory CocktailResponse.fromJson(Map<String, dynamic> json) =>
      _$CocktailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CocktailResponseToJson(this);

  String id;
  String? title;
  String? description;
  CocktailCategoryResponse? category;
  CocktailStrengthResponse? strength;
  String? glass;
  double? rating;
  CocktailImageResponse? image;
  List<String>? instructions;
  List<CocktailIngredientResponse>? ingredients;
}
