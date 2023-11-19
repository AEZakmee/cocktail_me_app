import 'package:core/model/cocktail/cocktail.dart';

import '../../../datasource/models/cocktail_response.dart';

extension CocktailMapper on CocktailResponse {
  Cocktail toDomain() => Cocktail(
        idDrink: idDrink ?? '',
        strDrink: strDrink ?? '',
      );
}
