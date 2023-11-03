import '../../app/model/cocktail/cocktail.dart';
import '../../domain/services/auth_service.dart';
import '../../domain/usecases/cocktails/get_coctails_use_case.dart';
import '../utils/base_viewmodel.dart';

final class HomeViewModel extends BaseViewModel {
  HomeViewModel({
    required GetCocktailsUseCase getCocktailsUseCase,
    required Auth auth,
  })  : _getCocktailsUseCase = getCocktailsUseCase,
        _auth = auth;

  final GetCocktailsUseCase _getCocktailsUseCase;
  final Auth _auth;

  List<Cocktail> get cocktails => _getCocktailsUseCase();
  int get cocktailsLength => cocktails.length;

  Future<void> logOut() => _auth.signOut();
}
