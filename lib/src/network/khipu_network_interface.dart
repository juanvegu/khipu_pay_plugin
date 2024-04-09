abstract class KhipuNetworkInterface {
  Future<String> getPaymentID();
  Future<String> getPaymentStatus(String paymentID);
}