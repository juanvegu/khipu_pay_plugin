import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:khipu_pay_plugin/src/util/constants.dart';

/// An implementation of [KhipuPayPluginPlatform] that uses method channels.
class MethodChannelKhipuPayPlugin {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel(Constants.methodChannel);

  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
