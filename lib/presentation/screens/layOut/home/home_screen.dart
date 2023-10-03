import 'package:flutter/material.dart';
import 'package:task/presentation/screens/layOut/home/components/home_imports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final audioPlayer = AudioPlayer();
  bool _isPlaying = false;
  bool _slider = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  void _audioPlayer() {
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        _isPlaying = state == PlayerState.playing;
      });
    });
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });
    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _audioPlayer();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppStrings.thisIsApp.tr()),
        body: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            AppSize.h50.ph,
            CustomAppText(
              text: AppStrings.topLikes.tr(),
              textSize: 20.sp,
              textWeight: FontWeight.bold,
            ).addSymmetricPadding(hVal: AppSize.h17),
            AppSize.h5.ph,
           const Divider(),
            AppSize.h20.ph,
            const LikesItem(),
            AppSize.h5.ph,
            const Divider(),
            AppSize.h40.ph,
            CustomAppText(
              text: AppStrings.topLikes.tr(),
              textSize: 20.sp,
              textWeight: FontWeight.bold,
            ).addSymmetricPadding(hVal: AppSize.h17),
            AppSize.h5.ph,
            const Divider(),
           AudioPlayerItem(
               sliderFunction: (value) async {
                 final position = Duration(seconds: value.toInt());
                 await audioPlayer.seek(position);
               },
               audioPlayFunction: () async {
                 setState(() {
                   _slider = true;
                 });
                 if (_isPlaying) {
                   await audioPlayer.pause();
                 } else {
                   await audioPlayer.play(
                       UrlSource(
                           'https://a-azzam.azq1.com/MyGuide/storage/books/16857118469130.mp3'));
                 }
               },
               duration: duration, position: position,
               isPlaying: _isPlaying, slider: _slider),
            const Divider(),
          ],
        ));
  }
}
