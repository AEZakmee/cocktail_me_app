import 'package:json_annotation/json_annotation.dart';

enum CocktailCategoryResponse {
  @JsonValue('COCKTAIL')
  cocktail,
  @JsonValue('SHOT')
  shot,
  @JsonValue('ORDINARY')
  ordinary,
}
