import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:shared/shared.dart';

@LazySingleton()
class AppPreferences {
  AppPreferences(this._sharedPreference);

  final SharedPreferences _sharedPreference;

  bool get isShowOnboarding {
    return _sharedPreference.getBool(SharedPreferenceKeys.isShowOnboarding) ??
        true;
  }

  Future<bool> saveStateOnboarding(bool isShowOnboarding) async {
    final success = await _sharedPreference.setBool(
      SharedPreferenceKeys.isShowOnboarding,
      isShowOnboarding,
    );

    return success;
  }
}
