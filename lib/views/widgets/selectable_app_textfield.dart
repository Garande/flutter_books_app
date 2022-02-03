import 'package:flutter/material.dart';

class SelectableAppTextField extends StatelessWidget {
  const SelectableAppTextField({
    Key? key,
    this.onTap,
    this.controller,
    this.hintText,
    this.borderRadius,
    this.icon,
    this.label,
    this.inputType = TextInputType.text,
    this.fontSize = 15.0,
  }) : super(key: key);
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final String? hintText;
  final double fontSize;
  final TextInputType inputType;
  final BorderRadius? borderRadius;
  final Icon? icon;
  final String? label;

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
        GestureDetector(
          onTap: onTap,
          child: Container(
            color: Colors.transparent,
            child: IgnorePointer(
              child: TextField(
                controller: controller,
                keyboardType: inputType,
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: fontSize,
                    ),
                decoration: InputDecoration(
                  errorMaxLines: 1,
                  hintText: hintText,
                  prefixIconConstraints: const BoxConstraints(
                    minHeight: 0.0,
                    minWidth: 0.0,
                  ),
                  prefixIcon: icon,
                  filled: true,
                  fillColor: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.color
                      ?.withOpacity(.2),
                  contentPadding: const EdgeInsets.only(
                    bottom: 10.0,
                    top: 10.0,
                    left: 10.0,
                    right: 10.0,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                        color: Theme.of(context).primaryColor, width: 2.25),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
