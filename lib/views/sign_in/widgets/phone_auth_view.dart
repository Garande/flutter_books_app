import 'package:book_mate/generated/app_localizations.dart';
import 'package:book_mate/utils/constants.dart';
import 'package:book_mate/views/widgets/app_button.dart';
import 'package:book_mate/views/widgets/app_textfield.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class PhoneAuthView extends StatelessWidget {
  const PhoneAuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.padding,
        vertical: AppConstants.padding,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.085),
            Text(
              AppLocalizations.of(context)!.sign_in,
              style: themeData.textTheme.headline1
                  ?.copyWith(color: themeData.primaryColor),
            ),
            _buildViewMessage(context, themeData),
            const SizedBox(
              height: 10,
            ),
            _buildInput(context),
            const SizedBox(
              height: 10,
            ),
            _buildDisclaimer(context, themeData),
            const SizedBox(
              height: 10,
            ),
            AppButton(
              text: AppLocalizations.of(context)!.btn_continue,
              isOutlined: false,
              gradient: LinearGradient(
                colors: [
                  themeData.primaryColor,
                  themeData.primaryColorLight,
                ],
                stops: [0.0, 1.0],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppTextField _buildInput(BuildContext context) {
    return AppTextField(
      prefix: CountryCodePicker(
        initialSelection: "UG",
        onChanged: (country) {},
      ),
      hintText: AppLocalizations.of(context)!.phone_number,
    );
  }

  Text _buildViewMessage(BuildContext context, ThemeData themeData) {
    return Text(
      AppLocalizations.of(context)!.sign_in_message,
      style: themeData.textTheme.bodyText1?.copyWith(
        color: themeData.textTheme.bodyText1?.color?.withOpacity(.7),
        fontSize: 15.0,
      ),
    );
  }

  RichText _buildDisclaimer(BuildContext context, ThemeData themeData) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: AppLocalizations.of(context)!.app_agreement_overview,
            style: themeData.textTheme.subtitle2?.copyWith(
              fontWeight: FontWeight.normal,
              fontSize: 13.0,
            ),
          ),
          TextSpan(
            text: AppLocalizations.of(context)!.terms_and_conditions,
            style: themeData.textTheme.subtitle2?.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 13.0,
              color: themeData.primaryColorLight,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, "/terms_and_conditions");
              },
          ),
          TextSpan(
            text: AppLocalizations.of(context)!.var_and,
            style: themeData.textTheme.subtitle2?.copyWith(
              fontWeight: FontWeight.normal,
              fontSize: 13.0,
            ),
          ),
          TextSpan(
            text: AppLocalizations.of(context)!.privacy_policy,
            style: themeData.textTheme.subtitle2?.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 13.0,
              color: themeData.primaryColorLight,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, "/privacy_policy");
              },
          ),
          TextSpan(
            text:
                '${AppLocalizations.of(context)!.var_of}${AppConstants.appName}',
            style: themeData.textTheme.subtitle2?.copyWith(
              fontWeight: FontWeight.normal,
              fontSize: 13.0,
            ),
          ),
        ],
      ),
    );
  }
}
