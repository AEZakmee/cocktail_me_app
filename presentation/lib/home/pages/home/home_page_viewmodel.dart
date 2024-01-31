import 'package:domain/model/cocktail/cocktail.dart';
import 'package:domain/model/cocktail/cocktail_category.dart';
import 'package:domain/services/cocktails/cocktails_service.dart';

import '../../../utils/base_viewmodel.dart';

final class HomePageViewModel extends BaseViewModel {
  HomePageViewModel({
    required CocktailService cocktailService,
  }) : _cocktailService = cocktailService;

  final CocktailService _cocktailService;

  List<Cocktail> _cocktails = [];
  List<Cocktail> get cocktails => _cocktails;

  @override
  Future<void> init() async {
    loadCocktails();
  }

  var _selectedCocktailCategory = CocktailCategory.cocktail;
  int get selectedCocktailCategoryIndex => _selectedCocktailCategory.index;
  void changeCocktailCategory(int index) {
    final category = CocktailCategory.values[index];
    if (_selectedCocktailCategory != category) {
      _selectedCocktailCategory = category;

      loadCocktails();
      notifyListeners();
    }
  }

  void loadCocktails() {
    _cocktails = _cocktailService.filterCocktails(
      categoryFilter: [_selectedCocktailCategory],
    ).toList();
  }
}
