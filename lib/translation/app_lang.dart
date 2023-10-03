import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/dataSources/local/shared_prefrences.dart';

class AppLangCubit extends Cubit<Locale> {
  AppLangCubit() : super(const Locale('en'));

  /// function to change language to arabic ///

  void changLangToAr(BuildContext context) {
    Prefs.setLang(true);
    context.setLocale(const Locale('ar'));
    emit(const Locale('ar'));
  }

  /// function to change language to english ///

  void changLangToEn(BuildContext context) {
    Prefs.setLang(false);
    context.setLocale(const Locale('en'));
    emit(const Locale('en'));
  }
}