import 'package:domain/services/auth.dart';

import '../utils/base_viewmodel.dart';

final class SignUpViewModel extends BaseViewModel {
  SignUpViewModel({required Auth auth}) : _auth = auth;

  final Auth _auth;

  void signUp() {
    _auth.signInAnonymously();
  }
}
