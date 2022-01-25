


import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get language => 'English';

  @override
  String get sign_in => 'Sign In';

  @override
  String get sign_in_message => 'Sign in to your account to continue enjoying our book app';

  @override
  String get app_agreement_overview => 'By tapping continue, you agree to our ';

  @override
  String get terms_and_conditions => ' Terms & Conditions ';

  @override
  String get and => 'and ';

  @override
  String get privacy_policy => 'Privacy Policy';

  @override
  String get var_of => 'of';

  @override
  String get btn_continue => 'Continue';

  @override
  String get verify_otp => 'Verify OTP';

  @override
  String get verify_otp_message => 'Enter the OTP code sent to ';

  @override
  String get failed_to_get_otp_message => 'If you didn\'t receive the verification code, tap to Resend ';

  @override
  String get resend => 'Resend';

  @override
  String get verify => 'Verify';
}
