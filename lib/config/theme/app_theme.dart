import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightThemeData => ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    dividerColor: Colors.grey,
  );

  static ThemeData get darkThemeData => ThemeData(
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: AppColors.appDarkColor,
      dividerColor: Colors.grey,
      brightness: Brightness.dark);
}
