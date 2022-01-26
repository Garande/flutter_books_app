import 'package:book_mate/generated/app_localizations.dart';
import 'package:book_mate/utils/constants.dart';
import 'package:book_mate/views/widgets/app_button.dart';
import 'package:book_mate/views/widgets/app_textfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class VerifyPhoneAuthView extends StatelessWidget {
  VerifyPhoneAuthView({Key? key}) : super(key: key);

  String code = '';

  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();
  FocusNode focusNode4 = FocusNode();
  FocusNode focusNode5 = FocusNode();
  FocusNode focusNode6 = FocusNode();

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
            Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.arrow_back,
                    color: themeData.primaryColor,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  AppLocalizations.of(context)!.verify_otp,
                  style: themeData.textTheme.headline1
                      ?.copyWith(color: themeData.primaryColor),
                ),
              ],
            ),
            _buildViewMessage(context, themeData),
            const SizedBox(
              height: 10,
            ),
            _buildInput(context),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    AppLocalizations.of(context)!.btn_resend,
                    style: themeData.textTheme.subtitle1
                        ?.copyWith(color: themeData.primaryColorLight),
                  ),
                ),
              ],
            ),
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

  Row _buildInput(BuildContext context) {
    return Row(
      children: [
        _getPinField(
          context: context,
          key: '1',
          focusNode: focusNode1,
        ),
        const SizedBox(width: 5.0),
        _getPinField(
          context: context,
          key: '2',
          focusNode: focusNode2,
        ),
        const SizedBox(width: 5.0),
        _getPinField(
          context: context,
          key: '3',
          focusNode: focusNode3,
        ),
        const SizedBox(width: 5.0),
        _getPinField(
          context: context,
          key: '4',
          focusNode: focusNode4,
        ),
        const SizedBox(width: 5.0),
        _getPinField(
          context: context,
          key: '5',
          focusNode: focusNode5,
        ),
        const SizedBox(width: 5.0),
        _getPinField(
          context: context,
          key: '6',
          focusNode: focusNode6,
        ),
      ],
    );
  }

  Expanded _getPinField({
    required BuildContext context,
    required String key,
    required FocusNode focusNode,
  }) {
    return Expanded(
      child: AppTextField(
        focusNode: focusNode,
        key: Key(key),
        inputType: TextInputType.number,
        onChanged: (txt) {
          if (txt.length == 1) {
            code += txt;
            switch (code.length) {
              case 1:
                focusNode1.requestFocus(focusNode2);
                break;
              case 2:
                focusNode2.requestFocus(focusNode3);
                break;
              case 3:
                focusNode3.requestFocus(focusNode4);
                break;
              case 4:
                focusNode4.requestFocus(focusNode5);
                break;
              case 5:
                focusNode5.requestFocus(focusNode6);
                break;
              case 6:
                focusNode6.unfocus();
                break;
              default:
                FocusManager.instance.primaryFocus?.unfocus();
                break;
            }
          }
        },
      ),
    );
  }

  RichText _buildViewMessage(BuildContext context, ThemeData themeData) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: AppLocalizations.of(context)!.verify_view_message,
            style: themeData.textTheme.bodyText1?.copyWith(
              color: themeData.textTheme.bodyText1?.color?.withOpacity(.7),
              fontSize: 15.0,
            ),
          ),
          TextSpan(
            text: '+256779xxxxxxx',
            style: themeData.textTheme.bodyText1?.copyWith(
              color: themeData.primaryColorLight.withOpacity(.7),
              fontSize: 15.0,
            ),
          ),
        ],
      ),
    );
  }
}
