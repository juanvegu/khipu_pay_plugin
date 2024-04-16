import 'package:khipu_pay_plugin/src/khipu_credential.dart';

final class KhipuPay {
  static KhipuPay get instance {
    assert(
      _instance._initialized,
      'You must initialize the KhipuPay instance before calling KhipuPay.instance',
    );
    return _instance;
  }

  KhipuPay._();
  static final KhipuPay _instance = KhipuPay._();

  bool _initialized = false;

  late final KhipuCredential credential;

  static Future<void> initialize() async {
    assert(
      !_instance._initialized,
      'This instance is already initialized',
    );

    _instance._init("khipuId", "khipuSecret");
  }

  void _init(
    String khipuId,
    String khipuSecret
  ) {
    credential = KhipuCredential(
      khipuId: khipuId, 
      khipuSecret: khipuSecret
    );
    _initialized = true;
  }
}
