import 'package:khipu_pay_plugin/src/khipu_pay_mobile.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract class KhipuPayPlatform extends PlatformInterface {
  KhipuPayPlatform() : super(token: _token);

  static final Object _token = Object();

  static KhipuPayPlatform _instance = KhipuPayMobile();

  static KhipuPayPlatform get instance => _instance;

  static set instance(KhipuPayPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  String processPayment() {
    throw UnimplementedError('processPayment() has not been implemented.');
  }
}