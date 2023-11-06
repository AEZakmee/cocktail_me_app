import '../../domain/services/auth_service.dart';
import '../app/router.dart';
import '../utils/base_viewmodel.dart';

final class SignInViewModel extends BaseViewModel {
  SignInViewModel({required Auth auth}) : _auth = auth;

  final Auth _auth;

  Future<void> signIn() async {
    await _auth.signInAnonymously();
    await navigatorKey.currentState?.pushNamedAndRemoveUntil(
      Routes.home,
      (route) => false,
    );
  }
}
