import 'package:json_annotation/json_annotation.dart';

import 'ingredient_icon_response.dart';

part 'ingredient_response.g.dart';

@JsonSerializable()
class IngredientResponse {
  IngredientResponse({
    required this.id,
    this.title,
    this.icon,
  });

  factory IngredientResponse.fromJson(Map<String, dynamic> json) =>
      _$IngredientResponseFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientResponseToJson(this);

  final String id;
  final String? title;
  final IngredientIconResponse? icon;
}
