import 'package:book_mate/models/app_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class BaseAuthenticationProvider {
  Future<bool> isLoggedIn();

  Future<GoogleSignInAccount?> signInWithGoogle();

  Future<void> sendOtp({
    required String phoneNumber,
    required PhoneVerificationCompleted phoneVerificationCompleted,
    required PhoneVerificationFailed phoneVerificationFailed,
    required PhoneCodeSent phoneCodeSent,
    required PhoneCodeAutoRetrievalTimeout autoRetrievalTimeout,
    required Duration timeOut,
    int? forceResendToken,
  });

  Future<User?> verifyPhoneNumber({
    required String verificationId,
    required String smsCode,
  });

  Future<User?> signInWithCredential(AuthCredential credential);

  Future<void> saveProfile(AppUser user);
}
