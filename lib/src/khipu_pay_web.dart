import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:khipu_pay_plugin/src/khipu_pay_platform.dart';

final class KhipuPayWeb extends KhipuPayPlatform {
  KhipuPayWeb();

  static void registerWith(Registrar registrar) {
    KhipuPayPlatform.instance = KhipuPayWeb();
  }

  @override
  String processPayment() {
    return 'Payment processed from web';
  } 
}
