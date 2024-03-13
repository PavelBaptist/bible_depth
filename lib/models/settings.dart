import 'package:hive_flutter/hive_flutter.dart';
part 'settings.g.dart';

@HiveType(typeId: 5)
class Settings {
  @HiveField(0)
  int currentBuildNumber = 0;
  @HiveField(1)
  String? currentVersion = '';
}
