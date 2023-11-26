import 'package:dependencies/exposer.dart';

part 'cocktail_response.g.dart';

@JsonSerializable()
class CocktailResponse {
  const CocktailResponse({
    this.idDrink,
    this.strDrink,
  });

  factory CocktailResponse.fromJson(Map<String, dynamic> json) =>
      _$CocktailResponseFromJson(json);

  final String? idDrink;
  final String? strDrink;

  Map<String, dynamic> toJson() => _$CocktailResponseToJson(this);
}
