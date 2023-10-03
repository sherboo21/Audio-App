import 'package:flutter/material.dart';
import 'more_imports.dart';
class MoreItem extends StatelessWidget {
  final Function(bool) themeFunction,langFunction;
   MoreItem({Key? key, required this.themeFunction, required this.langFunction}) : super(key: key);
  final List<String> _settingsTitle =[
    AppStrings.darkMode,
    AppStrings.arabicLang
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: _settingsTitle.asMap().entries.map((item) => Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: CustomAppText(
              text: item.value.tr(),
              textSize: 20.sp,
            ),
            trailing: Switch(
                trackColor: MaterialStateProperty.all(
                    const Color(0xFFD9D9D9)),
                activeColor: AppColors.mainColor,
                value: item.key == 0 ?
                Prefs.getThemeValue() : Prefs.getLang(),
                onChanged: item.key == 0 ?
                themeFunction : langFunction
            ),
          ),
          item.key == 1 ? const SizedBox() : const Divider()
        ],
      )).toList(),
    ).addSymmetricPadding(hVal: AppSize.w17);
  }
}
