import 'package:domain/model/cocktail/cocktail_category.dart';
import 'package:domain/model/cocktail/cocktail_strength.dart';
import 'package:domain/model/ingredient/ingredient.dart';
import 'package:domain/services/ingredients/fetch_ingredients_usecase.dart';

import '../../provider/global_filter_provider.dart';
import '../../utils/base_viewmodel.dart';
import '../../utils/debouncer.dart';

final class FilterSheetViewModel extends BaseViewModel {
  FilterSheetViewModel({
    required GlobalFilterProvider globalFilterProvider,
    required FetchIngredientsUseCase fetchIngredientsUseCase,
  })  : _filterProvider = globalFilterProvider,
        _fetchIngredients = fetchIngredientsUseCase;

  final GlobalFilterProvider _filterProvider;
  final FetchIngredientsUseCase _fetchIngredients;

  final Debouncer _debouncer = Debouncer(milliseconds: 300);

  Iterable<Ingredient> _selectedIngredients = [];
  Iterable<Ingredient> get selectedIngredients => _selectedIngredients;

  @override
  Future<void> init() async {
    await _loadIngredients();
    _filterProvider.addListener(_onFilterChanged);

    notifyListeners();
  }

  @override
  void dispose() {
    _filterProvider.removeListener(_onFilterChanged);
    super.dispose();
  }

  bool isCategorySelected(CocktailCategory category) =>
      _filterProvider.categories.contains(category);
  bool isStrengthSelected(CocktailStrength strength) =>
      _filterProvider.strengths.contains(strength);

  void updateCategory(CocktailCategory category) =>
      _filterProvider.updateCategory(category);
  void updateStrength(CocktailStrength strength) =>
      _filterProvider.updateStrength(strength);

  void resetFilters() => _filterProvider.resetFilters();

  Future<void> _onFilterChanged() async {
    notifyListeners();

    _debouncer.run(() async {
      await _loadIngredients();
      notifyListeners();
    });
  }

  Future<void> _loadIngredients() async {
    await loadData<Iterable<Ingredient>>(
      _fetchIngredients,
      onData: (data) {
        _selectedIngredients = data.where(
          (element) => _filterProvider.ingredients.contains(element.id),
        );
      },
    );
  }
}
