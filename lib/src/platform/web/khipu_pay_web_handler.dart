import 'dart:html';

import 'package:khipu_pay_plugin/src/platform/web/khipu_pay_web_handler_interface.dart';
import 'package:khipu_pay_plugin/src/util/constants.dart';

final class KhipuPayWebHandler implements KhipuPayWebHandlerInterface {
  KhipuPayWebHandler();
  
  @override
  void registerKhipuLibrary() {
    final ScriptElement scriptElement = ScriptElement();
    scriptElement.src = Constants.khipuScript;

    if (document.querySelector(Constants.scriptQuerySelector) == null) {
      document.head?.nodes.add(scriptElement);
    }
  }

  @override
  void registerEmbeddedKhipu() {
    final DivElement divElement = DivElement();
    divElement.id = Constants.khipuWebRoot;

    if (document.getElementById(Constants.khipuWebRoot) == null) {
      document.body?.append(divElement);
    }
  }

  @override
  void startKhipuPayment(String paymentId) {
    throw UnimplementedError();
  }
}