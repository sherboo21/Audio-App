import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../config/router/named_router.dart';
import '../config/router/named_router_impl.dart';
import '../presentation/stateMangements/bloc/multi_bloc_providers.dart';
import '../presentation/stateMangements/cubit/app_theme.dart';

class TaskApp extends StatelessWidget {
  const TaskApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: MultiBlocProviders.providers(context),
        child: BlocBuilder<AppThemeCubit, ThemeData>(
          builder: (context, state) {
            return ScreenUtilInit(
              designSize: const Size(360, 812),
              builder: (context, child) => GestureDetector(
                    onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                    child: MaterialApp(
                      localizationsDelegates: context.localizationDelegates,
                      supportedLocales: context.supportedLocales,
                      locale: context.locale,
                      initialRoute: Routes.layOutRouter,
                      onGenerateRoute: NamedNavigatorImpl.onGenerateRoute,
                      navigatorKey: NamedNavigatorImpl.navigatorState,
                      debugShowCheckedModeBanner: false,
                      title: 'Task App',
                      theme: state
                    ),
                  ),
            );
          },
        ));
  }
}