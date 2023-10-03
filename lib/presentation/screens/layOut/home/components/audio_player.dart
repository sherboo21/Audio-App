import 'package:flutter/material.dart';
import 'home_imports.dart';
class AudioPlayerItem extends StatelessWidget {
  final Function(double) sliderFunction;
  final Function() audioPlayFunction;
  final Duration duration, position;
  final bool isPlaying, slider;
  const AudioPlayerItem({Key? key, required this.sliderFunction, required this.audioPlayFunction, required this.duration, required this.position, required this.isPlaying, required this.slider}) : super(key: key);
  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return [if (duration.inHours > 0) hours, minutes, seconds].join();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSize.h10.ph,
        Visibility(
            visible: slider == true,
            child: Column(
              children: [
                Slider(
                  min: 0,
                  max: duration.inSeconds.toDouble(),
                  value: position.inSeconds.toDouble(),
                  onChanged: sliderFunction,
                  thumbColor: AppColors.mainColor,
                  inactiveColor: Colors.grey,
                  activeColor: AppColors.mainColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(formatTime(position)),
                    Text(formatTime(duration - position)),
                  ],
                ).addSymmetricPadding(hVal: AppSize.w20),
              ],
            )
        ),
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: AppSize.h17),
          title: CustomAppText(
            text: isPlaying ?
            '' : AppStrings.playThis.tr(),
            textSize: 16.sp,
          ),
          leading: InkWell(
            onTap: audioPlayFunction,
            child: SvgPicture.asset(
                isPlaying ?
                AppIcons.pauseIcon : AppIcons.playIcon
            ),
          ),
        ),
        AppSize.h10.ph,
      ],
    );
  }
}
