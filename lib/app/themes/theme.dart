import 'package:flutter/material.dart';
import 'package:flutter_app_with_stackexchange/app/global/constants.dart';

class Themes {
  static ThemeData lightTheme() {
    return ThemeData.light().copyWith(
      brightness: Brightness.light,
      appBarTheme: AppBarTheme(
          actionsIconTheme: IconThemeData(color: darkTextColor),
          backgroundColor: lightAppbarColor,
          titleTextStyle: TextStyle(color: lightTextColor, fontSize: 16)),
      cardColor: lightCardColor,
    );
  }

  static ThemeData darkTheme() {
    return ThemeData.dark().copyWith(
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
          actionsIconTheme: IconThemeData(color: lightTextColor),
          backgroundColor: darkAppbarColor,
          titleTextStyle: TextStyle(color: darkTextColor, fontSize: 16)),
      cardColor: darkCardColor,
      colorScheme: ColorScheme.light()
          .copyWith(secondary: darkAppbarColor, primary: darkAppbarColor),
    );
  }
}
