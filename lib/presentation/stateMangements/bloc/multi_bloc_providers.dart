import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../translation/app_lang.dart';
import '../cubit/app_bottom_nav.dart';
import '../cubit/app_theme.dart';

class MultiBlocProviders {
  static List<BlocProvider> providers(BuildContext context) => [
        BlocProvider<BottomNavBarCubit>(
          create: (context) => BottomNavBarCubit(),
        ),
        BlocProvider<AppLangCubit>(create: (context) => AppLangCubit()),
    BlocProvider<AppThemeCubit>(
      create: (context) => AppThemeCubit(),
    ),
      ];
}
