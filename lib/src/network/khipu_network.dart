import 'package:khipu_pay_plugin/src/config/network.dart';
import 'package:khipu_pay_plugin/src/config/network_path.dart';
import 'package:khipu_pay_plugin/src/network/khipu_network_interface.dart';

final class KhipuNetwork extends Network implements KhipuNetworkInterface {
  @override
  Future<String> getPaymentID() async {
    final response = await dio.post<String>(NetworkPath.payments, data: {});
    return response.data ?? '';
  }
}