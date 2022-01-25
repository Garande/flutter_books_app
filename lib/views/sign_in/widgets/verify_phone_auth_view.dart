import 'package:book_mate/generated/app_localizations.dart';
import 'package:book_mate/utils/constants.dart';
import 'package:book_mate/views/widgets/app_text_field.dart';
import 'package:book_mate/views/widgets/app_button.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class VerifyPhoneAuthView extends StatelessWidget {
  VerifyPhoneAuthView({Key? key}) : super(key: key);

  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  final FocusNode focusNode3 = FocusNode();
  final FocusNode focusNode4 = FocusNode();
  final FocusNode focusNode5 = FocusNode();
  final FocusNode focusNode6 = FocusNode();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData themeData = Theme.of(context);

    return SingleChildScrollView(
      child: Container(
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
            Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.arrow_back,
                    color: themeData.primaryColor,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  AppLocalizations.of(context)!.verify_otp,
                  style: themeData.textTheme.headline1?.copyWith(
                    color: themeData.primaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: AppLocalizations.of(context)!.verify_otp_message,
                    style: themeData.textTheme.bodyText1?.copyWith(
                      color:
                          themeData.textTheme.bodyText1?.color?.withOpacity(.7),
                      fontSize: 15.0,
                    ),
                  ),
                  TextSpan(
                    text: '+25677965....',
                    style: themeData.textTheme.bodyText1?.copyWith(
                      color: themeData.primaryColorLight.withOpacity(.7),
                      fontSize: 15.0,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: AppTextField(
                    focusNode: focusNode1,
                    onChanged: (txt) {},
                    autofocus: true,
                  ),
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Expanded(
                  child: AppTextField(
                    focusNode: focusNode2,
                    onChanged: (txt) {},
                    autofocus: false,
                  ),
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Expanded(
                  child: AppTextField(
                    focusNode: focusNode3,
                    onChanged: (txt) {},
                    autofocus: false,
                  ),
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Expanded(
                  child: AppTextField(
                    focusNode: focusNode4,
                    onChanged: (txt) {},
                    autofocus: false,
                  ),
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Expanded(
                  child: AppTextField(
                    focusNode: focusNode5,
                    onChanged: (txt) {},
                    autofocus: false,
                  ),
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Expanded(
                  child: AppTextField(
                    focusNode: focusNode6,
                    onChanged: (txt) {},
                    autofocus: false,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text:
                        AppLocalizations.of(context)!.failed_to_get_otp_message,
                    style: themeData.textTheme.subtitle2?.copyWith(
                      fontWeight: FontWeight.normal,
                      fontSize: 13.0,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    AppLocalizations.of(context)!.resend,
                    style: themeData.textTheme.subtitle1
                        ?.copyWith(color: themeData.primaryColor),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            AppButton(
              text: AppLocalizations.of(context)!.verify,
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
      ),
    );
  }
}
