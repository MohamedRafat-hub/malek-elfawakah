import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static late SharedPreferences _instance;

  static Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
  }

  static void setBool(key, value)
  {
    _instance.setBool(key , value);
  }

  static bool getBool(key)
  {
   return _instance.getBool(key) ?? false;
  }
}
