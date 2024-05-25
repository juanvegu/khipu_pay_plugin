import 'package:flutter/services.dart';
import 'package:khipu_pay_plugin/src/domain/khipu_result.dart';
import 'package:khipu_pay_plugin/src/platform/mobile/khipu_pay_mobile.dart';
import 'package:khipu_pay_plugin/src/util/constants.dart';

abstract class KhipuPayPlatform {
  KhipuPayPlatform();

  final MethodChannel _channel = const MethodChannel(Constants.khipuChannel);

  MethodChannel get channel => _channel;

  static KhipuPayPlatform instance = KhipuPayMobile();

  Future<KhipuResult?> processPayment(String paymentId) {
    throw UnimplementedError('processPayment() has not been implemented.');
  }
}
