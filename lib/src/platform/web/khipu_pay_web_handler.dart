import 'dart:convert';
import 'dart:async';
import 'dart:html';
import 'dart:js';

import 'package:khipu_pay_plugin/src/platform/web/khipu_pay_web_handler_interface.dart';
import 'package:khipu_pay_plugin/src/platform/web/constants_web.dart';

final class KhipuPayWebHandler implements KhipuPayWebHandlerInterface {
  KhipuPayWebHandler();
  
  @override
  void registerKhipuLibrary() {
    final ScriptElement scriptElement = ScriptElement();
    scriptElement.src = ConstantsWeb.khipuScript;

    if (document.querySelector(ConstantsWeb.scriptQuerySelector) == null) {
      document.head?.nodes.add(scriptElement);
    }

    scriptElement.onLoad.listen((_) {
      context.callMethod(ConstantsWeb.eval, [ConstantsWeb.exposeKhipu]);
    });
  }

  @override
  void registerEmbeddedKhipu() {
    final DivElement divElement = DivElement();
    divElement.id = ConstantsWeb.khipuWebRoot;

    if (document.getElementById(ConstantsWeb.khipuWebRoot) == null) {
      document.body?.append(divElement);
    }
  }

  @override
  Future<Map<String, dynamic>> startKhipuPayment(String paymentId) {
    try {
      final Completer<Map<String, dynamic>> completer = Completer();
      final khipu = JsObject(context['Khipu']);

      callback(jsObject) {
        Map<String, dynamic> khipuResult = jsonDecode(
          context[ConstantsWeb.json].callMethod(
            ConstantsWeb.stringify, [jsObject]
          ),
        );
        khipu.callMethod(ConstantsWeb.close);
        completer.complete(khipuResult);
      }

      var options = JsObject.jsify({
        ConstantsWeb.mountElement: document.getElementById(ConstantsWeb.khipuWebRoot), 
        ConstantsWeb.modal: true,
        ConstantsWeb.modalOptions: {
          ConstantsWeb.maxWidth: 450,
          ConstantsWeb.maxHeight: 780,
        },
        ConstantsWeb.options: {
          ConstantsWeb.skipExitPage: true,
        },
      });

      khipu.callMethod(ConstantsWeb.startOperation, [
        paymentId, callback, options,
      ]);

      return completer.future;
    } catch (e) {
      throw Exception("Error processing payment: $e");
    }
  }
}