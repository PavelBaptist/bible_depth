import 'package:data/data.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class StartDataSource {
  StartDataSource(this._appPreferences);

  final AppPreferences _appPreferences;

  Future<void> hideOnboarding() async {
    _appPreferences.saveStateOnboarding(false);
  }

  Future<bool> fetchIsShowOnboarding() async {
    return _appPreferences.isShowOnboarding;
  }
}
