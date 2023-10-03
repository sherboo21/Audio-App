String svgIconsName(String? image) {
  return 'assets/icons/$image.svg';
}

class AppIcons {
  static String get homeIcon => svgIconsName('home');
  static String get homeSelectedIcon => svgIconsName('home_selected');
  static String get moreIcon => svgIconsName('more');
  static String get moreSelectedIcon => svgIconsName('more_selected');
  static String get likeIcon => svgIconsName('like');
  static String get likeSelectedIcon => svgIconsName('like_selected');
  static String get playIcon => svgIconsName('play');
  static String get pauseIcon => svgIconsName('pause');
}
