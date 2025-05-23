import 'package:decor_home_app/core/theme/colors.dart';
import 'package:flutter/material.dart';

class ThemeApp {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: ColorsApp.white,
    scaffoldBackgroundColor: ColorsApp.white,
    
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: ColorsApp.dark,
    scaffoldBackgroundColor: ColorsApp.dark,
  );
}
