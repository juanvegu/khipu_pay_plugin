import 'package:khipu_pay_plugin/src/config/network.dart';
import 'package:khipu_pay_plugin/src/domain/khipu_credential.dart';
import 'package:khipu_pay_plugin/src/domain/khipu_payment.dart';
import 'package:khipu_pay_plugin/src/domain/khipu_status.dart';
import 'package:khipu_pay_plugin/src/network/khipu_network_interface.dart';

final class KhipuNetwork extends Network implements KhipuNetworkInterface {
  final KhipuCredential _credential;

  KhipuNetwork({
    required KhipuCredential credential
  }) : _credential = credential;

  @override
  Future<KhipuPayment> getPaymentID() async {
    throw UnimplementedError();
  }
  
  @override
  Future<KhipuStatus> getPaymentStatus(String paymentID) {
    throw UnimplementedError();
  }
}