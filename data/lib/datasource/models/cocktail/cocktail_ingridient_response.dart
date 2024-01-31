import 'package:json_annotation/json_annotation.dart';

part 'cocktail_ingridient_response.g.dart';

@JsonSerializable()
class CocktailIngredientResponse {
  CocktailIngredientResponse({
    required this.id,
    this.quantity,
  });

  factory CocktailIngredientResponse.fromJson(Map<String, dynamic> json) =>
      _$CocktailIngredientResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CocktailIngredientResponseToJson(this);

  String id;
  String? quantity;
}
