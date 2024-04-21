import 'package:khipu_pay_plugin/src/domain/khipu_payment.dart';
import 'package:khipu_pay_plugin/src/domain/khipu_status.dart';

abstract class KhipuNetworkInterface {
  Future<KhipuPayment> getPaymentID();
  Future<KhipuStatus> getPaymentStatus(String paymentID);
}