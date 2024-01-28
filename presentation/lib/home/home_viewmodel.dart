import 'package:domain/services/auth.dart';
import 'package:flutter/material.dart';

import '../utils/base_viewmodel.dart';

final class HomeViewModel extends BaseViewModel {
  HomeViewModel({
    required Auth auth,
  }) : _auth = auth;

  final Auth _auth;

  final pageController = PageController(initialPage: 1);
  int pageIndex = 1;

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
