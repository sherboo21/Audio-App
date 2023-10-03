import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/config/theme/app_colors.dart';
import 'package:task/data/dataSources/local/shared_prefrences.dart';

import '../../config/theme/app_textStyle.dart';

class CustomAppText extends StatelessWidget {
  final String text;
  final FontWeight? textWeight;
  final TextAlign? textAlign;
  final double? textSize;
  final Color? textColor;
  final int? maxLines;
  final TextOverflow? textOverflow;

  const CustomAppText(
      {Key? key,
      required this.text,
      this.textAlign,
      this.textSize,
      this.textWeight,
      this.textColor,
      this.maxLines,
      this.textOverflow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      overflow: textOverflow,
      style: AppTextStyle(
        textWeight: textWeight ?? FontWeight.w400,
        textSize: textSize ?? 14.sp,
        textColor: Prefs.getThemeValue() == true ?
        Colors.white : AppColors.textColor,
      ),
    );
  }
}
