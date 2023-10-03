import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/presentation/stateMangements/bloc/bloc_observer.dart';
import 'app/ab_hr_app.dart';
import 'data/dataSources/local/shared_prefrences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await EasyLocalization.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Prefs.init();
  return runApp(
      EasyLocalization(
      supportedLocales: const [
        Locale('ar'),
        Locale('en')
      ],
      fallbackLocale: const Locale('en'),
      path: 'assets/lang',
      saveLocale: true,
      child: (
          const TaskApp()
      )
  ));
}
