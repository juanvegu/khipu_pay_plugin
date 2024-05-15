import 'package:khipu_pay_plugin/khipu_pay_plugin.dart';
import 'package:khipu_pay_plugin/src/config/network.dart';
import 'package:khipu_pay_plugin/src/domain/khipu_credential.dart';
import 'package:khipu_pay_plugin/src/domain/khipu_payment_form.dart';
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
    String? khipuAPIKey,
  }) {
    assert(
      !_instance._initialized,
      'This instance is already initialized',
    );

    switch (keyMode) {
      case KeyMode.normal:
        assert(
          khipuAPIKey != null,
          'You must provide an API key when using KeyMode.norma',
        );

        _instance._init(khipuAPIKey!);
      case KeyMode.dartDefine:
        const khipuAPIKey = String.fromEnvironment(
          Constants.khipuAPIKey, 
          defaultValue: Constants.empty
        );

        assert(
          khipuAPIKey != Constants.empty,
          'You must provide an API key when using KeyMode.dartDefine',
        );

        _instance._init(khipuAPIKey);
    }
  }

  void _init(String khipuAPIKey) {
    final KhipuCredential credential = KhipuCredential(
      apiKey: khipuAPIKey,
    );

    final network = Network(credential: credential);
    _khipuNetwork = KhipuNetwork(network: network);
    _initialized = true;
  }

  Future<KhipuPayment> createPayment(KhipuPaymentForm payment) async {
    return await _khipuNetwork.createPayment(payment: payment);
  }

  String processPayment() {
    return KhipuPayPlatform.instance.processPayment();
  }

  Future<KhipuPayment> paymentStatus({required KhipuPayment payment}) async {
    return await _khipuNetwork.getPaymentById(id: payment.paymentId);
  }
}
