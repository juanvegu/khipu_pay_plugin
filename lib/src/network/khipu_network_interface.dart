import 'package:khipu_pay_plugin/src/domain/khipu_payment.dart';
import 'package:khipu_pay_plugin/src/domain/khipu_payment_form.dart';

abstract class KhipuNetworkInterface {
  Future<KhipuPayment> createPayment({required KhipuPaymentForm payment});
  Future<KhipuPayment> getPaymentById({required String id});
}