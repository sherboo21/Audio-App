import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/presentation/stateMangements/cubit/app_theme.dart';
import 'package:task/presentation/widgets/app_bottom_nav_bar.dart';
import '../../stateMangements/cubit/app_bottom_nav.dart';
import 'home/home_screen.dart';
import 'more/more_screen.dart';

class LayOutScreen extends StatefulWidget {
  const LayOutScreen({Key? key}) : super(key: key);

  @override
  State<LayOutScreen> createState() => _LayOutScreenState();
}

class _LayOutScreenState extends State<LayOutScreen> {
  final List<Widget> _screens = [
    const HomeScreen(),
    const MoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, ThemeData>(
      builder: (context, state) {
        return BlocBuilder<BottomNavBarCubit, int>(
          builder: (context, state) {
            var bottomNavCubit = context.read<BottomNavBarCubit>();
            return Scaffold(
              extendBody: true,
              bottomNavigationBar: AppBottomNavBar(
                  state: state, bottomNavBarCubit: bottomNavCubit),
              body: _screens[state],
            );
          },
        );
      },
    );
  }
}
