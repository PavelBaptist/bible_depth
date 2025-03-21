import 'package:shared/src/config/config.dart';
import '../di/di.dart' as di;

class SharedConfig extends Config {
  SharedConfig._();

  factory SharedConfig.getInstance() {
    return _instance;
  }

  static final SharedConfig _instance = SharedConfig._();

  @override
  Future<void> config() async {
    di.configureInjection();
  }
}
