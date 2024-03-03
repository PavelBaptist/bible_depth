// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:package_info/package_info.dart';

// class VersionHandler {
//   static const String _versionKey = 'database_version';

//   static Future<void> handleDatabaseUpdates() async {
//     final Box<dynamic> box = await Hive.openBox('bible_depth');
//     String versionDb = await getCurrentVersion(box);
//     String version = '';

//     // Проверяем текущую версию базы данных и применяем необходимые обновления
//     version = '1.0.0+1';
//     if (versionToInt(versionDb) < versionToInt(version)) {
//       print('Выполнены обработчики на версию $version');
//     }

//     version = '1.0.0+2';
//     if (versionToInt(versionDb) < versionToInt(version)) {
//       print('Выполнены обработчики на версию $version');
//     }
//     await box.put(_versionKey, getVersionFromPubspec());

//     // Другие обновления могут быть добавлены по аналогии с вышеприведенным кодом
//     // Просто добавьте блоки if для каждого обновления

//     await box.close();
//   }

//   static Future<String> getCurrentVersion(Box<dynamic> box) async {
//     // Получаем текущую версию базы данных
//     String currentVersion =
//         box.get(_versionKey, defaultValue: await getVersionFromPubspec());
//     return currentVersion;
//   }

//   static int versionToInt(String version) {
//     List<String> parts = version.split('+')[0].split('.');
//     int major = int.parse(parts[0]);
//     int minor = int.parse(parts[1]);
//     int patch = int.parse(parts[2]);
//     return major * 10000 + minor * 100 + patch;
//   }

//   static Future<String> getVersionFromPubspec() async {
//     PackageInfo packageInfo = await PackageInfo.fromPlatform();
//     return packageInfo.version;
//   }
// }
