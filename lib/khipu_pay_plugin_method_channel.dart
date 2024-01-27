import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'khipu_pay_plugin_platform_interface.dart';

/// An implementation of [KhipuPayPluginPlatform] that uses method channels.
class MethodChannelKhipuPayPlugin extends KhipuPayPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('khipu_pay_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
