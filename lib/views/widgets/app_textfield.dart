import 'package:book_mate/utils/constants.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    Key? key,
    this.hintText,
    this.autofocus = false,
    this.borderRadius = 5.0,
    this.controller,
    this.onChanged,
    this.focusNode,
    this.inputType,
    this.fontSize = 15.0,
    this.prefix,
  }) : super(key: key);
  final String? hintText;
  final bool autofocus;
  final double borderRadius;
  final TextEditingController? controller;
  final Function(String txt)? onChanged;
  final FocusNode? focusNode;
  final TextInputType? inputType;
  final double fontSize;
  final Widget? prefix;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: inputType,
      autofocus: autofocus,
      onChanged: onChanged,
      focusNode: focusNode,
      style:
          Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: fontSize),
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        prefixIcon: prefix,
        fillColor:
            Theme.of(context).textTheme.bodyText1?.color?.withOpacity(.2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppConstants.padding / 2,
          vertical: AppConstants.padding / 2,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            width: 1.8,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
