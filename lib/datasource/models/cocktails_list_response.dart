import 'package:json_annotation/json_annotation.dart';

import 'cocktail_response.dart';

part 'cocktails_list_response.g.dart';

@JsonSerializable()
class CocktailsDataResponse {
  CocktailsDataResponse({required this.cocktails});

  factory CocktailsDataResponse.fromJson(Map<String, dynamic> json) =>
      _$CocktailsDataResponseFromJson(json);

  List<CocktailResponse> cocktails;

  Map<String, dynamic> toJson() => _$CocktailsDataResponseToJson(this);
}
