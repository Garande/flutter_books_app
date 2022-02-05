import 'package:book_mate/models/app_user.dart';
import 'package:book_mate/providers/base/base_authentication_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationProvider extends BaseAuthenticationProvider {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Future<bool> isLoggedIn() async {
    final firebaseUser = _firebaseAuth.currentUser;
    return firebaseUser != null && firebaseUser.uid.isNotEmpty;
  }

  @override
  Future<GoogleSignInAccount?> signInWithGoogle() async {
    final GoogleSignInAccount? account = await _googleSignIn.signIn();

    return account;

    // if (account != null) {
    //   final GoogleSignInAuthentication authentication =
    //       await account.authentication;

    //   final AuthCredential credential = GoogleAuthProvider.credential(
    //     idToken: authentication.idToken,
    //     accessToken: authentication.accessToken,
    //   );
    //   return _firebaseAuth
    //       .signInWithCredential(credential)
    //       .then((value) => value.user);
    // }
  }

  @override
  Future<void> sendOtp({
    required String phoneNumber,
    required PhoneVerificationCompleted phoneVerificationCompleted,
    required PhoneVerificationFailed phoneVerificationFailed,
    required PhoneCodeSent phoneCodeSent,
    required PhoneCodeAutoRetrievalTimeout autoRetrievalTimeout,
    required Duration timeOut,
    int? forceResendToken,
  }) {
    return _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: phoneVerificationCompleted,
      verificationFailed: phoneVerificationFailed,
      codeSent: phoneCodeSent,
      codeAutoRetrievalTimeout: autoRetrievalTimeout,
      timeout: timeOut,
      forceResendingToken: forceResendToken,
    );
  }

  @override
  Future<User?> verifyPhoneNumber({
    required String verificationId,
    required String smsCode,
  }) {
    AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);

    return _firebaseAuth
        .signInWithCredential(credential)
        .then((value) => value.user);
  }

  @override
  Future<User?> signInWithCredential(AuthCredential credential) {
    return _firebaseAuth
        .signInWithCredential(credential)
        .then((value) => value.user);
  }

  @override
  Future<void> saveProfile(AppUser user) {
    return FirebaseFirestore.instance
        .collection('/users')
        .doc(user.id)
        .set(
          user.toJson(),
          SetOptions(merge: true),
        )
        .then(
      (value) async {
        final SharedPreferences _preferences =
            await SharedPreferences.getInstance();
        _preferences.setString('userId', user.id ?? '');
      },
    );
  }
}
