import 'package:flutter/material.dart';

class FontsApp {
  static TextStyle title({required Color color, double? fontSize}) {
    return TextStyle(
        fontFamily: 'Mulish',
        fontSize: fontSize ?? 20,
        fontWeight: FontWeight.w600,
        color: color);
  }

  static TextStyle subTitle({required Color color, double? fontSize}) {
    return TextStyle(
      fontFamily: 'Mulish',
      fontSize: fontSize ?? 15,
      fontWeight: FontWeight.w500,
      color: color,
    );
  }

  static TextStyle subText({required Color color, double? fontSize}) {
    return TextStyle(
      fontFamily: 'Barlow',
      fontSize: fontSize ?? 14,
      fontWeight: FontWeight.normal,
      color: color
    );
  }

  static TextStyle paragraph({required Color color, double? fontSize}) {
    return TextStyle(
      fontFamily: 'Barlow',
      fontSize: fontSize ?? 13,
      fontWeight: FontWeight.w300,
    );
  }
}
