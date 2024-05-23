abstract class KhipuPayWebHandlerInterface {
  void registerKhipuLibrary();
  void registerEmbeddedKhipu();
  Future<Map<String, dynamic>> startKhipuPayment(String paymentId);
}