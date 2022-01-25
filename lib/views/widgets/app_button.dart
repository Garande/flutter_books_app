import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    this.child,
    this.text,
    this.gradient,
    this.width,
    this.height = 40.0,
    this.borderRadius = 5.0,
    this.isOutlined = false,
    this.onTap,
  }) : super(key: key);
  final Widget? child;
  final String? text;
  final Gradient? gradient;
  final double? width, height, borderRadius;
  final bool isOutlined;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: !isOutlined && gradient != null ? gradient! : null,
        borderRadius: BorderRadius.circular(borderRadius!),
        border: isOutlined
            ? Border.all(
                color: Theme.of(context).primaryColor,
                width: 2.0,
              )
            : null,
      ),
      child: Material(
        borderRadius: BorderRadius.circular(borderRadius!),
        color: !isOutlined && gradient == null
            ? Theme.of(context).primaryColor
            : Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(borderRadius!),
          highlightColor: Colors.transparent,
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
