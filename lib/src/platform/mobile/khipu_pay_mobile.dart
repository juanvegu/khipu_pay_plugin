import 'package:flutter/services.dart';
import 'package:khipu_pay_plugin/src/domain/khipu_result.dart';
import 'package:khipu_pay_plugin/src/khipu_pay_platform.dart';
import 'package:khipu_pay_plugin/src/util/constants.dart';

final class KhipuPayMobile extends KhipuPayPlatform {
  KhipuPayMobile();

  @override
  Future<KhipuResult?> processPayment(String paymentId) async {
    final Map<String, dynamic> arguments = {Constants.paymentId: paymentId};

    try {
      final String? result =
          await channel.invokeMethod(Constants.launchKhipuMethod, arguments);

      if (result == null) {
        return null;
      }

      return khipuResultFromJson(result);
    } on PlatformException catch (e) {
      throw Exception("Error processing payment: $e");
    } catch (e) {
      throw Exception("Error parsing KhipuResult: $e");
    }
  }
}
