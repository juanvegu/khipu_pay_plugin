import 'package:khipu_pay_plugin/src/config/network.dart';
import 'package:khipu_pay_plugin/src/config/network_path.dart';
import 'package:khipu_pay_plugin/src/domain/khipu_payment.dart';
import 'package:khipu_pay_plugin/src/domain/khipu_payment_form.dart';
import 'package:khipu_pay_plugin/src/network/khipu_network_interface.dart';

final class KhipuNetwork implements KhipuNetworkInterface {
  final Network _network;

  KhipuNetwork({required Network network}) : _network = network;

  @override
  Future<KhipuPayment> createPayment({required KhipuPaymentForm payment}) async {
    try {
      final response = await _network.dio.post(
        NetworkPath.payments, 
        data: payment.toJson()
      );
      
      return KhipuPayment.fromJson(response.data);
    } catch (e) {
      throw Exception('Error creating payment');
    }
  }
  
  @override
  Future<KhipuPayment> getPaymentById({required String id}) async {
    try {
      final response = await _network.dio.get('${NetworkPath.payments}/$id');
      return KhipuPayment.fromJson(response.data);
    } catch (e) {
      throw Exception('Error getting payment by id');
    }
  }
}