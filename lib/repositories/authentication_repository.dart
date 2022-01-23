import 'package:book_mate/providers/authentication_provider.dart';
import 'package:book_mate/providers/base/base_authentication_provider.dart';

class AuthenticationRepostory {
  final BaseAuthenticationProvider _authenticationProvider =
      AuthenticationProvider();

  Future<bool> isLoggedIn() => _authenticationProvider.isLoggedIn();
}
