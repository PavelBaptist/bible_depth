import 'dart:convert';

import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';

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
