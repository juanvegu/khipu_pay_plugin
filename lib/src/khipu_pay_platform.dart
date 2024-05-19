import 'package:flutter/services.dart';
import 'package:khipu_pay_plugin/src/khipu_pay_mobile.dart';
import 'package:khipu_pay_plugin/src/util/constants.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract class KhipuPayPlatform extends PlatformInterface {
  KhipuPayPlatform() : super(token: _token);

  static final Object _token = Object();

  final MethodChannel _channel = const MethodChannel(Constants.khipuChannel);

  MethodChannel get channel => _channel;

  static KhipuPayPlatform _instance = KhipuPayMobile();

  static KhipuPayPlatform get instance => _instance;

  static set instance(KhipuPayPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String> processPayment(String paymentId) {
    throw UnimplementedError('processPayment() has not been implemented.');
  }
}