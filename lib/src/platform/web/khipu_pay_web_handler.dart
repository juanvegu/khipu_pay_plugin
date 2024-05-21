import 'dart:html';
import 'dart:js' as js;

import 'package:khipu_pay_plugin/src/platform/web/khipu_pay_web_handler_interface.dart';
import 'package:khipu_pay_plugin/src/util/constants.dart';

final class KhipuPayWebHandler implements KhipuPayWebHandlerInterface {
  ScriptElement? script;

  KhipuPayWebHandler();
  
  @override
  void registerKhipuLibrary() {
    final ScriptElement scriptElement = ScriptElement()
      ..type = Constants.khipuScriptType
      ..src = Constants.khipuScript;

    if (querySelector(Constants.scriptQuerySelector) == null) {
      document.head?.nodes.add(scriptElement);
    }
  }

  @override
  void registerEmbeddedKhipu() {
    final DivElement divElement = DivElement()
      ..id = Constants.khipuWebRoot;

    if (document.getElementById(Constants.khipuWebRoot) == null) {
      document.body?.append(divElement);
    }
  }

  @override
  void startKhipuPayment(String paymentId) {
    js.context['callback'] = (result) {
      print(result);
    };

    js.context['options'] = {
      'mount': document.getElementById(Constants.khipuWebRoot),
      'modal': true,
      'modalOptions': {
        'maxWidth': '450',
        'maxHeight': '860',
      }
    };
    
    js.JsFunction khipuClass = js.context['Khipu'];
    js.JsObject khipu = js.JsObject(khipuClass);

    khipu.callMethod(
      'startOperation', [
        paymentId, 
        js.context['callback'], 
        js.context['options']
      ]
    );
  }
}