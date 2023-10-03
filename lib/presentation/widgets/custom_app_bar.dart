import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/config/theme/app_colors.dart';
import 'package:task/presentation/widgets/custom_text.dart';
import '../../data/dataSources/local/shared_prefrences.dart';
import '../../utils/app_size.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar(
      {Key? key,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      backgroundColor:
          Prefs.getThemeValue() == false ? Colors.white : AppColors.appDarkColor,
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: CustomAppText(
        text: title,
        textSize: 22.sp,
        textWeight: FontWeight.bold,
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.maxFinite, AppSize.h65);
}
