import 'package:json_annotation/json_annotation.dart';

part 'cocktail_image_response.g.dart';

@JsonSerializable()
class CocktailImageResponse {
  CocktailImageResponse({
    this.type,
    this.url,
  });

  factory CocktailImageResponse.fromJson(Map<String, dynamic> json) =>
      _$CocktailImageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CocktailImageResponseToJson(this);

  String? type;
  String? url;
}
