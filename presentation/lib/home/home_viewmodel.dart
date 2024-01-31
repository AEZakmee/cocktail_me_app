import 'package:domain/services/auth.dart';
import 'package:domain/usecases/cocktails/load_coctails_use_case.dart';
import 'package:flutter/material.dart';

import '../model/ui_state.dart';
import '../utils/base_viewmodel.dart';

final class HomeViewModel extends BaseViewModel {
  HomeViewModel({
    required LoadCocktailsUseCase loadCocktailsUseCase,
    required Auth auth,
    super.uiState = UIState.success,
  })  : _loadCocktailsUseCase = loadCocktailsUseCase,
        _auth = auth;

  final LoadCocktailsUseCase _loadCocktailsUseCase;
  final Auth _auth;

  final pageController = PageController(initialPage: 1);
  int pageIndex = 1;

  @override
  Future<void> init() async {
    final success = await _loadCocktailsUseCase();
    if (!success) {
      setError();
    }
  }

  Future<void> changePage(int index) async {
    if (pageIndex == index) {
      return;
    }

    pageIndex = index;
    notifyListeners();

    await Future.delayed(const Duration(milliseconds: 50));

    await pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  Future<void> logOut() => _auth.signOut();
}
