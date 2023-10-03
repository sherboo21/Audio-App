import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../config/theme/app_theme.dart';
import '../../../data/dataSources/local/shared_prefrences.dart';

class AppThemeCubit extends Cubit<ThemeData> {
  AppThemeCubit()
      : super(Prefs.getThemeValue() == false
      ? AppTheme.lightThemeData
      : AppTheme.darkThemeData);

  void updateAppTheme() {
    if (state == AppTheme.lightThemeData) {
      Prefs.setThemeValue(true);
      emit(AppTheme.darkThemeData);
    } else {
      Prefs.setThemeValue(false);
      emit(AppTheme.lightThemeData);
    }
  }
}
