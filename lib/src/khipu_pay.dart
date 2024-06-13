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

  /// Initializes the Khipu Pay plugin.
  ///
  /// This method is used to initialize the Khipu Pay plugin.
  /// Call this method before using any other methods or properties of the plugin.
  ///
  /// Example usage:
  ///
  /// KhipuPay.initialize();
  ///
  /// Note: This method should be called only once during the app's lifecycle.
  static void initialize({String? apiKey}) {
    assert(
      !_instance._initialized,
      'This instance is already initialized',
    );

    if (apiKey != null && apiKey.isNotEmpty) {
      _instance._init(apiKey);
    } else {
      const apiKey = String.fromEnvironment(Constants.khipuAPIKey, defaultValue: Constants.empty);

      if (apiKey.isEmpty) {
        throw ArgumentError('You must provide an API key in the environment variables or as a parameter to initialize() method.');
      }

      _instance._init(apiKey);
    }
  }

  void _init(String apiKey) {
    final KhipuCredential credential = KhipuCredential(apiKey: apiKey);

    _khipuNetwork = KhipuNetwork(credential: credential);
    _initialized = true;
  }

  /// Creates a Khipu payment using the provided [payment] form.
  ///
  /// Returns a [Future] that completes with a [KhipuPayment] object representing the created payment.
  /// The [payment] parameter is a [KhipuPaymentForm] object containing the necessary information to create the payment.
  ///
  /// Example usage:
  ///
  /// KhipuPaymentForm paymentForm = KhipuPaymentForm(
  ///   amount: 100.0,
  ///   subject: 'Payment for goods',
  ///   currency: 'USD',
  ///   receiverId: 'your_receiver_id',
  /// );
  ///
  /// KhipuPayment payment = await createPayment(paymentForm);
  /// print(payment.paymentId);
  Future<KhipuPayment> createPayment(KhipuPaymentForm payment) async {
    return await _khipuNetwork.createPayment(payment: payment);
  }

  /// Processes a payment with the specified payment ID.
  ///
  /// Returns a [KhipuResult] object representing the result of the payment process.
  /// If the payment process is successful, the [KhipuResult] object will contain
  /// the necessary information about the payment. If the payment process fails,
  /// the [KhipuResult] object will be null.
  ///
  /// The [paymentId] parameter is the ID of the payment to be processed.
  ///
  /// Throws an exception if there is an error during the payment process.
  static Future<KhipuResult?> processPayment({required String paymentId}) async {
    return await KhipuPayPlatform.instance.processPayment(paymentId);
  }

  /// Retrieves the status of a Khipu payment.
  ///
  /// The [paymentId] parameter is the unique identifier of the payment.
  ///
  /// Returns a [Future] that resolves to a [KhipuPayment] object representing the payment status.
  Future<KhipuPayment> paymentStatus({required String paymentId}) async {
    return await _khipuNetwork.getPaymentById(id: paymentId);
  }
}
