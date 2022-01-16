import 'package:flutter/material.dart';

class HexColor extends Color {
  HexColor(final String hexColorCode) : super(_parseHexColor(hexColorCode));

  static int _parseHexColor(String hexColorCode) {
    hexColorCode = hexColorCode.replaceAll('#', '');
    if (hexColorCode.length == 6) {
      hexColorCode = 'FF' + hexColorCode;
    }
    return int.parse(hexColorCode, radix: 16);
  }
}
