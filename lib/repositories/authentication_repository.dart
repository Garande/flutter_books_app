import 'package:book_mate/providers/authentication_provider.dart';
import 'package:book_mate/providers/base/base_authentication_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationRepostory {
  final BaseAuthenticationProvider _authenticationProvider =
      AuthenticationProvider();

  Future<bool> isLoggedIn() => _authenticationProvider.isLoggedIn();

  Future<User?> signInWithGoogle() =>
      _authenticationProvider.signInWithGoogle();

  Future<void> sendOtp({
    required String phoneNumber,
    required PhoneVerificationCompleted phoneVerificationCompleted,
    required PhoneVerificationFailed phoneVerificationFailed,
    required PhoneCodeSent phoneCodeSent,
    required PhoneCodeAutoRetrievalTimeout autoRetrievalTimeout,
    required Duration timeOut,
    int? forceResendToken,
  }) =>
      _authenticationProvider.sendOtp(
        phoneNumber: phoneNumber,
        phoneVerificationCompleted: phoneVerificationCompleted,
        phoneVerificationFailed: phoneVerificationFailed,
        phoneCodeSent: phoneCodeSent,
        autoRetrievalTimeout: autoRetrievalTimeout,
        timeOut: timeOut,
      );

  Future<User?> verifyPhoneNumber({
    required String verificationId,
    required String smsCode,
  }) =>
      _authenticationProvider.verifyPhoneNumber(
        verificationId: verificationId,
        smsCode: smsCode,
      );

  Future<User?> signInWithCredential(AuthCredential credential) =>
      _authenticationProvider.signInWithCredential(credential);
}
