abstract class KhipuPayWebHandlerInterface {
  void registerKhipuLibrary();
  void registerEmbeddedKhipu();
  void startKhipuPayment(String paymentId);
}