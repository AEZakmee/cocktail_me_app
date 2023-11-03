import '../../app/model/cocktail/cocktail.dart';
import '../../app/model/cocktail/cocktails_data.dart';
import '../../datasource/config/cocktails/cocktails_data_client.dart';
import 'mappers/cocktails_mapper.dart';

class CocktailsRepository {
  CocktailsRepository({
    required CocktailsConfigClient cocktailsConfigClient,
  }) : _cocktailsConfigClient = cocktailsConfigClient;

  final CocktailsConfigClient _cocktailsConfigClient;

  CocktailsData _cocktailsData = CocktailsData.empty();
  bool _loaded = false;

  void _loadData() {
    _cocktailsData = _cocktailsConfigClient.getData().toDomain();
  }

  CocktailsData get _loadedData {
    if (_loaded) {
      return _cocktailsData;
    }
    _loadData();
    _loaded = true;
    return _cocktailsData;
  }

  List<Cocktail> get cocktails => _loadedData.cocktails;
}
