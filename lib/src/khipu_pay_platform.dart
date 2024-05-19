import 'package:flutter/services.dart';
import 'package:khipu_pay_plugin/src/khipu_pay_mobile.dart';
import 'package:khipu_pay_plugin/src/util/constants.dart';

abstract class KhipuPayPlatform {
  KhipuPayPlatform();

  final MethodChannel _channel = const MethodChannel(Constants.khipuChannel);

  MethodChannel get channel => _channel;

  static KhipuPayPlatform instance = KhipuPayMobile();

  Future<String?> processPayment(String paymentId) {
    throw UnimplementedError('processPayment() has not been implemented.');
  }
}