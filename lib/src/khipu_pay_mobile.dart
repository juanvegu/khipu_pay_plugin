import 'package:khipu_pay_plugin/src/khipu_pay_platform.dart';

final class KhipuPayMobile extends KhipuPayPlatform {
  KhipuPayMobile();

  @override
  String processPayment() {
    return 'Payment processed from mobile';
  }
}