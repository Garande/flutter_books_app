import 'package:bloc/bloc.dart';
import 'package:book_mate/models/app_user.dart';
import 'package:book_mate/models/country.dart';
import 'package:book_mate/repositories/authentication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(const SignInState(status: SignInStatus.initial));

  final _authenticationRepository = AuthenticationRepostory();

  void phoneNumberChanged(String phone) {
    emit(
      state.copyWith(
        phoneNumber: phone,
      ),
    );
  }

  void countryChanged(Country country) {
    emit(
      state.copyWith(country: country),
    );
  }

  void otpChanged(String otp) {
    emit(state.copyWith(otp: otp));
  }

  Future<void> verifyPhoneNumber() async {
    try {
      User? user = await _authenticationRepository.verifyPhoneNumber(
        verificationId: state.verificationId!,
        smsCode: state.otp!,
      );

      if (user != null) {
        emit(state.copyWith(status: SignInStatus.otpVerificationSuccess));
        // SAVE USER TO DATABASE

        emit(state.copyWith(status: SignInStatus.authenticated));
      }
    } catch (e) {
      emit(state.copyWith(
        status: SignInStatus.exception,
        error: e.toString(),
      ));
    }
  }

  void sendOtp() async {
    String phoneNumber = state.phoneNumber!;
    if (phoneNumber.isNotEmpty && phoneNumber[0] == '0') {
      phoneNumber = phoneNumber.substring(1);
    }

    final phoneNumberTxt = ((state.country?.dialCode ?? '+256') + phoneNumber);

    print(phoneNumber);

    await _authenticationRepository.sendOtp(
      phoneNumber: phoneNumberTxt,
      phoneVerificationCompleted: phoneVerificationCompleted,
      phoneVerificationFailed: phoneVerificationFailed,
      phoneCodeSent: phoneCodeSent,
      autoRetrievalTimeout: autoRetrievalTimeout,
      timeOut: const Duration(seconds: 30),
    );
  }

  Future<void> phoneVerificationCompleted(AuthCredential credential) async {
    try {
      User? user =
          await _authenticationRepository.signInWithCredential(credential);
      if (user != null) {
        emit(state.copyWith(status: SignInStatus.otpVerificationSuccess));
        // SAVE USER TO DATABASE

        emit(state.copyWith(status: SignInStatus.authenticated));
      }
    } catch (e) {
      emit(state.copyWith(
        status: SignInStatus.exception,
        error: e.toString(),
      ));
    }
  }

  void phoneVerificationFailed(FirebaseAuthException exception) {
    emit(
      state.copyWith(
        status: SignInStatus.exception,
        error: exception.stackTrace.toString(),
      ),
    );
  }

  void phoneCodeSent(String verificationId, int? forceResendToken) {
    emit(
      state.copyWith(
        verificationId: verificationId,
        forceResendToken: forceResendToken,
        status: SignInStatus.otpSent,
      ),
    );
  }

  void autoRetrievalTimeout(String verificationId) {
    emit(
      state.copyWith(
        verificationId: verificationId,
      ),
    );
  }

  Future<void> signInWithGoogle() async {
    emit(state.copyWith(status: SignInStatus.authInProgress));
    try {
      User? user = await _authenticationRepository.signInWithGoogle();
      if (user != null) {
        emit(
          state.copyWith(
            status: SignInStatus.googleAuthenticated,
            googleUser: user,
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: SignInStatus.exception,
          error: e.toString(),
          googleUser: null,
        ),
      );
    }
  }
}
