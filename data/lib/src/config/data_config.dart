import 'package:data/src/di/di.dart' as di;
import 'package:shared/shared.dart';

class DataConfig extends Config {
  DataConfig._();

  factory DataConfig.getInstance() {
    return _instance;
  }

  static final DataConfig _instance = DataConfig._();

  @override
  Future<void> config() async => di.configureInjection();
}
