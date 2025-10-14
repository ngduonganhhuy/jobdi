import 'package:flutter/material.dart';

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  String toHex({bool leadingHashSign = true}) {
    final alphaInt = (a * 255.0).round() & 0xff;
    final redInt = (r * 255.0).round() & 0xff;
    final greenInt = (g * 255.0).round() & 0xff;
    final blueInt = (b * 255.0).round() & 0xff;
    return '${leadingHashSign ? '#' : ''}'
        '${alphaInt.toRadixString(16).padLeft(2, '0')}'
        '${redInt.toRadixString(16).padLeft(2, '0')}'
        '${greenInt.toRadixString(16).padLeft(2, '0')}'
        '${blueInt.toRadixString(16).padLeft(2, '0')}';
  }
}
