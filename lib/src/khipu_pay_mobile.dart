import 'package:khipu_pay_plugin/src/khipu_pay_platform.dart';
import 'package:khipu_pay_plugin/src/util/constants.dart';

final class KhipuPayMobile extends KhipuPayPlatform {
  KhipuPayMobile();

  @override
  Future<String?> processPayment(String paymentId) async {
    final Map<String, dynamic> arguments = {
      Constants.paymentId: paymentId
    };
    
    return await channel.invokeMethod(
      Constants.launchKhipuMethod,
      arguments,
    );
  }
}