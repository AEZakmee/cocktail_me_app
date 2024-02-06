import 'package:domain/model/cocktail/cocktail.dart';
import 'package:domain/model/cocktail/cocktail_category.dart';
import 'package:domain/model/cocktail/cocktail_strength.dart';
import 'package:domain/services/cocktails/fetch_cocktails_usecase.dart';

import '../../../provider/global_filter_provider.dart';
import '../../../utils/base_viewmodel.dart';
import '../../../utils/debouncer.dart';

final class HomePageViewModel extends BaseViewModel {
  HomePageViewModel({
    required GlobalFilterProvider globalFilterProvider,
    required FetchCocktailsUseCase fetchCocktailsUseCase,
  })  : _filterProvider = globalFilterProvider,
        _fetchCocktails = fetchCocktailsUseCase;

  final GlobalFilterProvider _filterProvider;
  final FetchCocktailsUseCase _fetchCocktails;

  final Debouncer _debouncer = Debouncer(milliseconds: 300);

  List<Cocktail> _cocktails = [];
  List<Cocktail> get cocktails => _cocktails;

  @override
  Future<void> init() async {
    await _loadCocktails();

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

  void _onFilterChanged() {
    notifyListeners();
    _updateCocktails();
  }

  Future<void> _updateCocktails() async {
    _debouncer.run(() async {
      await _loadCocktails();
      notifyListeners();
    });
  }

  Future<void> _loadCocktails() async {
    await loadData<Iterable<Cocktail>>(
      () => _fetchCocktails(
        categoryFilter: _filterProvider.categories,
        strengthFilter: _filterProvider.strengths,
      ),
      onData: (data) {
        _cocktails = data.toList();
      },
    );
  }
}
