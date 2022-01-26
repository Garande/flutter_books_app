import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    this.child,
    this.text,
    this.height = 40,
    this.width,
    this.borderRadius = 5.0,
    this.isOutlined = false,
    this.gradient,
    this.onTap,
  }) : super(key: key);
  final Widget? child;
  final String? text;
  final double? height, width;
  final double borderRadius;
  final bool isOutlined;
  final Gradient? gradient;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: isOutlined
            ? Border.all(
                color: Theme.of(context).primaryColor,
                width: 1.8,
              )
            : null,
        gradient: !isOutlined && gradient != null ? gradient : null,
      ),
      child: Material(
        color: !isOutlined && gradient == null
            ? Theme.of(context).primaryColor
            : Colors.transparent,
        borderRadius: BorderRadius.circular(borderRadius),
        child: InkWell(
          highlightColor: Colors.transparent,
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              child ??
                  Text(
                    text ?? '',
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          color: !isOutlined
                              ? Colors.white
                              : Theme.of(context).primaryColor,
                        ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
