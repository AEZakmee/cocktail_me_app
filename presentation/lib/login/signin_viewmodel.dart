import 'package:domain/services/auth.dart';

import '../utils/base_viewmodel.dart';

final class SignInViewModel extends BaseViewModel {
  SignInViewModel({required Auth auth}) : _auth = auth;

  final Auth _auth;

  Future<void> signInAnonymously() async {
    await _auth.signInAnonymously();
  }

  void signIn() {}
}
