import 'package:book_mate/utils/constants.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    Key? key,
    this.controller,
    this.hintText,
    this.inputType,
    this.onChanged,
    this.borderRadius = 5.0,
    this.fontSize = 15.0,
    this.autofocus = false,
    this.prefixIcon,
    this.focusNode,
  }) : super(key: key);
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? inputType;
  final Function(String txt)? onChanged;
  final double borderRadius;
  final double fontSize;
  final bool autofocus;
  final Widget? prefixIcon;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: Theme.of(context).textTheme.bodyText1?.copyWith(
            fontSize: fontSize,
          ),
      autofocus: autofocus,
      focusNode: focusNode,
      keyboardType: inputType,
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: Colors.grey[300]?.withOpacity(.7),
        prefixIcon: prefixIcon,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppConstants.padding / 2,
          vertical: AppConstants.padding / 2,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 2.0,
          ),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
