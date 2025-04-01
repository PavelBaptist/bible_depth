import 'package:bible_depth/config/app_config.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:shared/shared.dart';

abstract class ApplicationConfig extends Config {}

class AppInitializer {
  AppInitializer(this._applicationConfig);

  final ApplicationConfig _applicationConfig;

  Future<void> init() async {
    await SharedConfig.getInstance().init();
    await DataConfig.getInstance().init();
    await DomainConfig.getInstance().init();
    await _applicationConfig.init();
    await AppConfig.getInstance().init();
  }
}
