import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static SharedPreferences? _prefs;

  static const _keyForSplash = 'keyForSplash';

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> setBoolForSplash(bool value) async {
    return await _prefs?.setBool(_keyForSplash, value) ?? false;
  }

  static bool? getBoolForSplash() {
    return _prefs?.getBool(_keyForSplash);
  }

  // static const _keyForRegistrationForm = 'keyForRegistration';

  // static Future<void> initRegistrationForm() async {
  //   _prefs = await SharedPreferences.getInstance();
  // }

  // static Future<bool> setBoolForRegistrationForm(bool value) async {
  //   return await _prefs?.setBool(_keyForRegistrationForm, value) ?? false;
  // }

  // static bool? getBoolForRegistrationForm() {
  //   return _prefs?.getBool(_keyForRegistrationForm);
  // }
}
