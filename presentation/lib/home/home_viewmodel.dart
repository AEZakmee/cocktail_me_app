import 'package:domain/model/cocktail/cocktail.dart';
import 'package:domain/services/auth.dart';
import 'package:domain/usecases/cocktails/fetch_coctails_use_case.dart';
import 'package:domain/utils/extensions.dart';

import '../utils/base_viewmodel.dart';

final class HomeViewModel extends BaseViewModel {
  HomeViewModel({
    required FetchCocktailsUseCase fetchCocktailsUseCase,
    required Auth auth,
  })  : _fetchCocktailsUseCase = fetchCocktailsUseCase,
        _auth = auth;

  final FetchCocktailsUseCase _fetchCocktailsUseCase;
  final Auth _auth;

  List<Cocktail> _cocktails = List.empty();

  List<Cocktail> get cocktails => _cocktails;
  int get cocktailsLength => cocktails.length;

  @override
  Future<void> init() async {
    final response = await _fetchCocktailsUseCase();

    response.fold(
      onSuccess: (data) {
        _cocktails = data;
        setSuccess();
      },
      onError: (_) {
        setError();
      },
    );
  }

  Future<void> logOut() => _auth.signOut();
}
