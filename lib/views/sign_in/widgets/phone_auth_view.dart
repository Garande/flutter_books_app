import 'package:book_mate/generated/app_localizations.dart';
import 'package:book_mate/utils/constants.dart';
import 'package:book_mate/views/widgets/app_text_field.dart';
import 'package:book_mate/views/widgets/app_button.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class PhoneAuthView extends StatelessWidget {
  const PhoneAuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData themeData = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: AppConstants.padding,
        horizontal: AppConstants.padding,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.085,
          ),
          Text(
            AppLocalizations.of(context)!.sign_in,
            style: themeData.textTheme.headline1?.copyWith(
              color: themeData.primaryColor,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            AppLocalizations.of(context)!.sign_in_message,
            style: themeData.textTheme.bodyText1?.copyWith(
              color: themeData.textTheme.bodyText1?.color?.withOpacity(.7),
              fontSize: 15.0,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          AppTextField(
            hintText: 'Phone Number',
            prefixIcon: CountryCodePicker(
              onChanged: (CountryCode countryCode) {},
              initialSelection: 'UG',
            ),
            // prefixIcon: CountryCodePick,
          ),
          const SizedBox(
            height: 10,
          ),
          RichText(
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
                      Navigator.pushNamed(context, '/terms_and_conditions');
                    },
                ),
                TextSpan(
                  text: AppLocalizations.of(context)!.and,
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
                      Navigator.pushNamed(context, '/privacy_policy');
                    },
                ),
                TextSpan(
                  text:
                      ' ${AppLocalizations.of(context)!.var_of} ${AppConstants.appName}',
                  style: themeData.textTheme.subtitle2?.copyWith(
                    fontWeight: FontWeight.normal,
                    fontSize: 13.0,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          AppButton(
            text: 'Continue',
            isOutlined: false,
            onTap: () {},
            gradient: LinearGradient(
              colors: [
                themeData.primaryColor,
                themeData.primaryColorLight,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          )
        ],
      ),
    );
  }
}
