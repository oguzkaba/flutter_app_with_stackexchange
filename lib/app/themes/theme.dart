import 'package:flutter/material.dart';
import 'package:flutter_app_with_stackexchange/app/constants.dart';

class Themes {
  static ThemeData lightTheme() {
    return ThemeData.light().copyWith(
      brightness: Brightness.light,
      appBarTheme: AppBarTheme(backgroundColor: appBarColor),
      cardColor: lightCardColor, 
      colorScheme: ColorScheme.light().copyWith(secondary: appBarColor,primary: appBarColor),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData.dark().copyWith(
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(backgroundColor: appBarColor),
      cardColor: darkCardColor,
      colorScheme: ColorScheme.light().copyWith(secondary: appBarColor,primary: appBarColor),
    );
  }
}
