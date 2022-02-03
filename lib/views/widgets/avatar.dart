import 'dart:io';

import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String? photoUrl;
  final String? defaultLetter;
  final double? size;
  final BorderRadius? borderRadius;
  final Color? background;
  final File? imageFile;
  final double? height;
  final double? width;
  final String? placeholder;

  const Avatar({
    Key? key,
    this.photoUrl,
    this.defaultLetter,
    this.size,
    this.borderRadius,
    this.background,
    this.imageFile,
    this.width,
    this.height,
    this.placeholder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(100),
      child: Container(
        width: width ?? size,
        height: height ?? size,
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(100),
          color:
              photoUrl == null || defaultLetter == null || defaultLetter == ''
                  ? Colors.grey[200]
                  : Theme.of(context).primaryColorLight,
        ),
        child: imageFile != null
            ? Image.file(
                imageFile!,
                fit: BoxFit.cover,
                width: width ?? size,
                height: height ?? size,
              )
            : (photoUrl != null && photoUrl != ''
                ? Image.network(
                    photoUrl ?? '',
                    fit: BoxFit.cover,
                    width: width ?? size,
                    height: height ?? size,
                  )
                : defaultLetter != null && defaultLetter != ''
                    ? Center(
                        child: Text(
                          defaultLetter ?? '',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Image.asset(
                          placeholder ?? 'assets/images/account.png',
                          width: size,
                          height: size,
                          fit: BoxFit.cover,
                          color: Colors.blueGrey[200],
                        ),
                      )),
      ),
    );
  }
}
