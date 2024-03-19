import 'package:bible_depth/models/fragment_list.dart';
import 'package:bible_depth/models/settings.dart';
import 'package:bible_depth/models/structural_law_list.dart';
import 'package:bible_depth/models/word_style.dart';
import 'package:bible_depth/models/word_style_list.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:package_info/package_info.dart';

abstract class VersionHandler {
  static Settings? _settings;

  static Future<void> handleDatabaseUpdates() async {
    final Box<dynamic> settingsBox = await Hive.openBox('settings');
    String versionFromPubspec = await getVersionFromPubspec();
    _settings = settingsBox.get('settings');

    // если приложение запущено впервые
    if (weight(_settings!.currentVersion!) == 0 &&
        weight(versionFromPubspec) > weight('1.0.2')) {
      _updateVersion(settingsBox, versionFromPubspec);
    }

    // проверяем текущую версию базы данных и применяем необходимые обновления
    String version = '0.0.0';

    version = '1.0.2';
    if (weight(_settings!.currentVersion!) < weight(version)) {
      await _updateHandlerBuildVersion_1_0_2();
      _updateVersion(settingsBox, version);
    }

    // другие обновления могут быть добавлены по аналогии с вышеприведенным кодом
    // просто добавьте блоки if для каждого обновления

    if (_settings!.currentVersion != versionFromPubspec) {
      _updateVersion(settingsBox, versionFromPubspec);
    }

    await settingsBox.close();
  }

  static _updateVersion(Box<dynamic> settingsBox, String version) async {
    _settings!.currentVersion = version;
    await settingsBox.put('settings', _settings);
    print('Приложение обновлено до $version');
  }

  static Future<String> getVersionFromPubspec() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  static String getVersionFromDB() {
    return _settings!.currentVersion!;
  }

  static int weight(String version) {
    if (version.isEmpty) {
      return 0;
    }
    List<String> versionParts = version.split('+');
    String versionNumber = versionParts[0];

    List<int> weights = versionNumber.split('.').map(int.parse).toList();

    int weight = 0;
    int multiplier = 1;

    for (int i = weights.length - 1; i >= 0; i--) {
      weight += weights[i] * multiplier;
      multiplier *= 1000;
    }

    return weight;
  }

  // update build version 3
  static _updateHandlerBuildVersion_1_0_2() async {
    final Box<dynamic> box = await Hive.openBox('bible_depth');

    WordStyleList? wordStyleList = box.get('word_styles');
    StructuralLawList? structuralLawList = box.get('structural_laws');
    FragmentList? fragmentList = box.get('fragments');

    if (wordStyleList != null &&
        structuralLawList != null &&
        fragmentList != null) {
      for (var fragment in fragmentList.list) {
        fragment.wordStyleList = wordStyleList;
        fragment.structuralLawList = structuralLawList;
      }
      await box.put('fragments', fragmentList);

      await box.delete('word_styles');
      await box.delete('structural_laws');
    }
    await box.close();
  }
}
