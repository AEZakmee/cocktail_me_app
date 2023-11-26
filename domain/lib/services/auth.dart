import 'package:dependencies/exposer.dart';

class Auth {
  Auth({
    required FirebaseAuth firebaseAuth,
  }) : _firebaseAuth = firebaseAuth;

  final FirebaseAuth _firebaseAuth;

  Stream<bool> observeAuthenticated() => _firebaseAuth.userChanges().map(
        (user) => user != null,
      );

  bool get isAuthenticated => _firebaseAuth.currentUser != null;

  Future<void> signInAnonymously() => _firebaseAuth.signInAnonymously();
  Future<void> signOut() => _firebaseAuth.signOut();
}
