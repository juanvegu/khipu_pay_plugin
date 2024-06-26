import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:khipu_pay_plugin/src/domain/khipu_result.dart';
import 'package:khipu_pay_plugin/src/khipu_pay_platform.dart';
import 'package:khipu_pay_plugin/src/platform/web/khipu_pay_web_handler.dart';
import 'package:khipu_pay_plugin/src/platform/web/khipu_pay_web_handler_interface.dart';

final class KhipuPayWeb extends KhipuPayPlatform {
  final KhipuPayWebHandlerInterface handler;

  KhipuPayWeb({
    required this.handler,
  });

  static void registerWith(Registrar registrar) {
    KhipuPayWebHandler handler = KhipuPayWebHandler();
    KhipuPayPlatform.instance = KhipuPayWeb(handler: handler);
    handler.registerKhipuLibrary();
    handler.registerEmbeddedKhipu();
  }

  @override
  Future<KhipuResult?> processPayment(String paymentId) async {
    try {
      final khipuResult = await handler.startKhipuPayment(paymentId);
      return KhipuResult.fromJson(khipuResult);
    } on PlatformException catch (e) {
      throw Exception("Error processing payment: $e");
    } catch (e) {
      throw Exception("Error parsing KhipuResult: $e");
    }
  }
}
