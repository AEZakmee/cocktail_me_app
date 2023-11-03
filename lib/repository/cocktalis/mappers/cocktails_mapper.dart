import '../../../app/model/cocktail/cocktail.dart';
import '../../../app/model/cocktail/cocktails_data.dart';
import '../../../datasource/models/cocktail_response.dart';
import '../../../datasource/models/cocktails_list_response.dart';

extension CocktailListMapper on CocktailsDataResponse {
  CocktailsData toDomain() => CocktailsData(
        cocktails: cocktails.map((e) => e.toDomain()).toList(),
      );
}

extension CocktailMapper on CocktailResponse {
  Cocktail toDomain() => Cocktail(
        idDrink: idDrink ?? '',
        strDrink: strDrink ?? '',
      );
}
