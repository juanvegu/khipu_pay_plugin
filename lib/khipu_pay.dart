import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';

class KhipuPay {
  static const MethodChannel _channel = MethodChannel('khipu_pay');

  static initialize({String? hexaColor}) async {
    if (Platform.isIOS) {
      await _channel.invokeMethod(
        'initialize',
        <String, dynamic>{
          'hexaColor': hexaColor,
        },
      );
    }
  }

  /// Returns a [String] object that indicates the status of the payment
  /// process.
  ///
  /// The `paymentId` argument will be used to process the payment associated
  /// with your billing account in Khipu.
  static Future<String> paymentProcess({required String paymentId}) async {
    if (paymentId.isEmpty) {
      throw ArgumentError.value(paymentId, 'paymentId cannot be empty');
    }

    final String? paymentStatus = await _channel.invokeMethod<String>(
      'paymentProcess',
      <String, dynamic>{
        'paymentId': paymentId,
      },
    );

    return paymentStatus == null ? "FAILURE" : paymentStatus;
  }
}
