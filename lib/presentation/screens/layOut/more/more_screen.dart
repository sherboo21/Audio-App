import 'package:flutter/material.dart';
import 'package:task/presentation/screens/layOut/more/components/more_imports.dart';
class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  void themeFunction(bool value) => setState(() {
      Prefs.getThemeValue() == value;
      context.read<AppThemeCubit>().updateAppTheme();
    });

  void langFunction(bool value) =>setState(() {
    Prefs.getLang() == value;
    context.locale == const Locale('en') ?
    context.read<AppLangCubit>().changLangToAr(context) :  context.read<AppLangCubit>().changLangToEn(context);
    NamedNavigatorImpl().push(Routes.layOutRouter);
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppStrings.more.tr()),
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          AppSize.h50.ph,
          CustomAppText(
            text: AppStrings.settings.tr(),
            textSize: 20.sp,
              textWeight: FontWeight.bold,
          ).addSymmetricPadding(hVal: AppSize.w17),
          AppSize.h5.ph,
          const Divider(),
          AppSize.h20.ph,
          MoreItem(themeFunction: themeFunction,langFunction: langFunction),
          const Divider()
        ],
      ),
    );
  }
}
