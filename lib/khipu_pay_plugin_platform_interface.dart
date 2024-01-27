import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'khipu_pay_plugin_method_channel.dart';

abstract class KhipuPayPluginPlatform extends PlatformInterface {
  /// Constructs a KhipuPayPluginPlatform.
  KhipuPayPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static KhipuPayPluginPlatform _instance = MethodChannelKhipuPayPlugin();

  /// The default instance of [KhipuPayPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelKhipuPayPlugin].
  static KhipuPayPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [KhipuPayPluginPlatform] when
  /// they register themselves.
  static set instance(KhipuPayPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
