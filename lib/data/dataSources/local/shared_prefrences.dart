import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;

class Prefs {
  static init() async {
    prefs = await SharedPreferences.getInstance();
  }
  /// set app local lang value ///

  static Future<bool> setLang(value) async {
    return await prefs.setBool('lang_value', value);
  }

  static bool getLang() {
    return prefs.getBool('lang_value') ?? false;
  }

  // set theme value //

  static Future<bool> setThemeValue(value) async {
    return await prefs.setBool('theme_value', value);
  }

  static bool getThemeValue() {
    return prefs.getBool('theme_value') ?? false;
  }
}
