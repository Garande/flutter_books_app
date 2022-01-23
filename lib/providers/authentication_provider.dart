import 'package:book_mate/providers/base/base_authentication_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationProvider extends BaseAuthenticationProvider {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Future<bool> isLoggedIn() async {
    final firebaseUser = _firebaseAuth.currentUser;
    return firebaseUser != null && firebaseUser.uid.isNotEmpty;
  }
}
