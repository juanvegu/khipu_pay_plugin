import 'package:khipu_pay_plugin/src/domain/khipu_payment.dart';
import 'package:khipu_pay_plugin/src/domain/khipu_payment_form.dart';

abstract class KhipuNetworkInterface {
  Future<void> confirmPaymentById({required String id});
  Future<KhipuPayment> createPayment({required KhipuPaymentForm payment});
  Future<void> deletePaymentById({required String id});
  Future<void> getBanks();
  Future<KhipuPayment> getPaymentById({required String id});
  Future<void> getPaymentMethods({required String id});
  Future<void> getPaymentPrediction();
  Future<void> postReceiver();
  Future<void> refundPaymentById({required String id});
}
