import 'package:book_mate/generated/app_localizations.dart';
import 'package:book_mate/utils/constants.dart';
import 'package:book_mate/views/sign_in/cubit/sign_in_cubit.dart';
import 'package:book_mate/views/widgets/app_button.dart';
import 'package:book_mate/views/widgets/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyPhoneAuthView extends StatelessWidget {
  VerifyPhoneAuthView({Key? key}) : super(key: key);

  String code = '';

  final focusNode1 = FocusNode();
  final focusNode2 = FocusNode();
  final focusNode3 = FocusNode();
  final focusNode4 = FocusNode();
  final focusNode5 = FocusNode();
  final focusNode6 = FocusNode();

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
            _buildHeader(themeData, context),
            _buildViewMessage(context, themeData),
            const SizedBox(
              height: 10,
            ),
            _buildInput(context),
            const SizedBox(
              height: 10,
            ),
            _buildResendButton(context, themeData),
            const SizedBox(
              height: 10,
            ),
            _buildSubmitButton(context, themeData),
          ],
        ),
      ),
    );
  }

  AppButton _buildSubmitButton(BuildContext context, ThemeData themeData) {
    return AppButton(
      text: AppLocalizations.of(context)!.btn_continue,
      isOutlined: false,
      gradient: LinearGradient(
        colors: [
          themeData.primaryColor,
          themeData.primaryColorLight,
        ],
        stops: const [0.0, 1.0],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      onTap: () {
        context.read<SignInCubit>().verifyPhoneNumber();
      },
    );
  }

  Row _buildResendButton(BuildContext context, ThemeData themeData) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            context.read<SignInCubit>().sendOtp();
          },
          child: Text(
            AppLocalizations.of(context)!.btn_resend,
            style: themeData.textTheme.subtitle1
                ?.copyWith(color: themeData.primaryColorLight),
          ),
        ),
      ],
    );
  }

  Row _buildHeader(ThemeData themeData, BuildContext context) {
    return Row(
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
        textAlign: TextAlign.center,
        maxLength: 1,
        onChanged: (txt) {
          code += txt;
          code.trim();
          context.read<SignInCubit>().otpChanged(code);
          if (txt.length == 1) {
            switch (code.length) {
              case 1:
                FocusScope.of(context).requestFocus(focusNode2);
                break;
              case 2:
                FocusScope.of(context).requestFocus(focusNode3);
                break;
              case 3:
                FocusScope.of(context).requestFocus(focusNode4);
                break;
              case 4:
                FocusScope.of(context).requestFocus(focusNode5);
                break;
              case 5:
                FocusScope.of(context).requestFocus(focusNode6);
                break;
              default:
                FocusScope.of(context).unfocus();
                break;
            }
          }
        },
      ),
    );
  }

  BlocBuilder _buildViewMessage(BuildContext context, ThemeData themeData) {
    return BlocBuilder<SignInCubit, SignInState>(
      builder: (context, state) {
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
                text: '${state.country?.dialCode}${state.phoneNumber}',
                style: themeData.textTheme.bodyText1?.copyWith(
                  color: themeData.primaryColorLight.withOpacity(.7),
                  fontSize: 15.0,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
