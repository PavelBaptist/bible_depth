import 'dart:ffi';

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
    int buildVersionFromPubspec = await getBuildVersionFromPubspec();
    _settings = settingsBox.get('settings');

    // если приложение запущено впервые
    if (_settings!.currentBuildNumber == 0 && buildVersionFromPubspec > 13) {
      _updateBuildVersion(settingsBox, buildVersionFromPubspec);
    }

    // проверяем текущую версию базы данных и применяем необходимые обновления
    int currentBuildVersion = 0;

    currentBuildVersion = 4;
    if (_settings!.currentBuildNumber < currentBuildVersion) {
      await _updateHandlerBuildVersion4();
      _updateBuildVersion(settingsBox, currentBuildVersion);
    }

    // другие обновления могут быть добавлены по аналогии с вышеприведенным кодом
    // просто добавьте блоки if для каждого обновления

    if (_settings!.currentBuildNumber != buildVersionFromPubspec) {
      _updateBuildVersion(settingsBox, buildVersionFromPubspec);
    }

    await settingsBox.put('settings', _settings);

    await settingsBox.close();
  }

  static _updateBuildVersion(Box<dynamic> settingsBox, int buildVersion) async {
    _settings!.currentBuildNumber = buildVersion;
    await settingsBox.put('settings', _settings);
    print('Приложение обновлено до $buildVersion версии сборки');
  }

  static Future<int> getBuildVersionFromPubspec() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return int.tryParse(packageInfo.buildNumber) ?? 0;
  }

  static getBuildVersionFromDB() {
    return _settings!.currentBuildNumber;
  }

  // update build version 3
  static _updateHandlerBuildVersion4() async {
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
