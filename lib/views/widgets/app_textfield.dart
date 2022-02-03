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
    this.label,
    this.textAlign = TextAlign.start,
    this.maxLength,
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
  final String? label;
  final TextAlign textAlign;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Text(label!,
              style: Theme.of(context).textTheme.subtitle1?.copyWith()),
        if (label != null)
          const SizedBox(
            height: 5,
          ),
        TextField(
          controller: controller,
          keyboardType: inputType,
          autofocus: autofocus,
          onChanged: onChanged,
          focusNode: focusNode,
          textAlign: textAlign,
          maxLength: maxLength,
          style: Theme.of(context)
              .textTheme
              .bodyText1
              ?.copyWith(fontSize: fontSize),
          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            prefixIcon: prefix,
            counterText: '',
            counter: null,
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
        ),
      ],
    );
  }
}
