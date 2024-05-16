import 'package:khipu_pay_plugin/khipu_pay_plugin.dart';
import 'package:khipu_pay_plugin/src/domain/khipu_credential.dart';
import 'package:khipu_pay_plugin/src/khipu_pay_platform.dart';
import 'package:khipu_pay_plugin/src/network/khipu_network.dart';
import 'package:khipu_pay_plugin/src/network/khipu_network_interface.dart';
import 'package:khipu_pay_plugin/src/util/constants.dart';

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

  late KhipuNetworkInterface _khipuNetwork;

  static void initialize({
    KeyMode keyMode = KeyMode.dartDefine,
    String? apiKey,
  }) {
    assert(
      !_instance._initialized,
      'This instance is already initialized',
    );

    switch (keyMode) {
      case KeyMode.normal:
        assert(
          apiKey != null && apiKey.isNotEmpty,
          'You must provide an API key when using KeyMode.normal',
        );

        _instance._init(apiKey!);
      case KeyMode.dartDefine:
        const apiKey = String.fromEnvironment(
          Constants.khipuAPIKey, 
          defaultValue: Constants.empty
        );

        assert(
          apiKey.isNotEmpty,
          'You must provide an API key when using KeyMode.dartDefine',
        );

        _instance._init(apiKey);
    }
  }

  void _init(String apiKey) {
    final KhipuCredential credential = KhipuCredential(apiKey: apiKey);

    _khipuNetwork = KhipuNetwork(credential: credential);
    _initialized = true;
  }

  Future<KhipuPayment> createPayment(KhipuPaymentForm payment) async {
    return await _khipuNetwork.createPayment(payment: payment);
  }

  String processPayment() {
    return KhipuPayPlatform.instance.processPayment();
  }

  Future<KhipuPayment> paymentStatus({required String paymentId}) async {
    return await _khipuNetwork.getPaymentById(id: paymentId);
  }
}
