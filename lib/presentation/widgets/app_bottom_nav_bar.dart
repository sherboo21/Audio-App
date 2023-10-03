import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
import 'package:task/presentation/stateMangements/cubit/app_bottom_nav.dart';

import '../../config/theme/app_colors.dart';
import '../../data/dataSources/local/shared_prefrences.dart';
import '../../utils/app_imgs.dart';
import '../../utils/app_size.dart';
import '../../utils/app_strings.dart';

class AppBottomNavBar extends StatelessWidget {
  final int state;
  final BottomNavBarCubit bottomNavBarCubit;
  const AppBottomNavBar({Key? key, required this.state, required this.bottomNavBarCubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: Prefs.getThemeValue() == true ?
        AppColors.appDarkColor : Colors.white,
        elevation: 10,
        currentIndex: state,
        selectedLabelStyle: TextStyle(
          color: AppColors.mainColor,
        ),
        unselectedLabelStyle: TextStyle(
          color: Prefs.getThemeValue() == true ?
              Colors.white : AppColors.textColor,
        ),
        selectedItemColor: AppColors.mainColor,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppIcons.homeIcon,
              width: AppSize.w25,
              height: AppSize.h25,
            ),
            activeIcon: SvgPicture.asset(
              AppIcons.homeSelectedIcon,
              width: AppSize.w25,
              height: AppSize.h25,
            ),
            label: AppStrings.home.tr(),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppIcons.moreIcon,
              width: AppSize.w20,
              height: AppSize.h20,
            ),
            activeIcon: SvgPicture.asset(
              AppIcons.moreSelectedIcon,
              width: AppSize.w20,
              height: AppSize.h20,
            ),
            label: AppStrings.more.tr(),
          ),
        ],
        onTap: (index) => bottomNavBarCubit.updateIndex(index));
  }
}
