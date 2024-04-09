import 'package:khipu_pay_plugin/src/config/network.dart';
import 'package:khipu_pay_plugin/src/network/khipu_network_interface.dart';

final class KhipuNetwork extends Network implements KhipuNetworkInterface {
  @override
  Future<String> getPaymentID() async {
    throw UnimplementedError();
  }
  
  @override
  Future<String> getPaymentStatus(String paymentID) {
    throw UnimplementedError();
  }
}