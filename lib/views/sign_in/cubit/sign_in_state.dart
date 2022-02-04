part of 'sign_in_cubit.dart';

enum SignInStatus {
  initial,
  authInProgress,
  googleAuthenticated,
  otpSent,
  pendingOtpVerification,
  otpVerificationSuccess,
  otpVerificationFailure,
  exception,
  authenticated,
  unauthenticated,
  profileUpdateInProgress,
  profileUpdateComplete,
}

class SignInState extends Equatable {
  final SignInStatus? status;
  final String? error, phoneNumber, verificationId, otp;
  final int? forceResendToken;
  final User? googleUser;
  final AppUser? appUser;
  final Country? country;

  const SignInState({
    this.status,
    this.error,
    this.phoneNumber,
    this.verificationId,
    this.forceResendToken,
    this.googleUser,
    this.appUser,
    this.country,
    this.otp,
  });

  SignInState copyWith({
    SignInStatus? status,
    String? error,
    phoneNumber,
    verificationId,
    int? forceResendToken,
    User? googleUser,
    AppUser? appUser,
    Country? country,
    String? otp,
  }) {
    return SignInState(
      status: status ?? this.status,
      error: error ?? this.error,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      verificationId: verificationId ?? this.verificationId,
      forceResendToken: forceResendToken ?? this.forceResendToken,
      googleUser: googleUser ?? this.googleUser,
      appUser: appUser ?? this.appUser,
      country: country ?? this.country,
      otp: otp ?? this.otp,
    );
  }

  @override
  List<Object?> get props => [
        status,
        error,
        phoneNumber,
        verificationId,
        forceResendToken,
        googleUser,
        appUser,
        country,
        otp,
      ];
}
