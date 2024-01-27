
import 'khipu_pay_plugin_platform_interface.dart';

class KhipuPayPlugin {
  Future<String?> getPlatformVersion() {
    return KhipuPayPluginPlatform.instance.getPlatformVersion();
  }
}
