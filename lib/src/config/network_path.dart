final class NetworkPath {
  static const String baseUrl = 'https://payment-api.khipu.com/v3';

  static String banks() => '$baseUrl/banks';
  static String confirmPayment(String paymentId) => '$baseUrl/payments/$paymentId/confirm';
  static String getPayment(String paymentId) => '$baseUrl/payments/$paymentId';
  static String deletePayment(String paymentId) => '$baseUrl/payments/$paymentId';
  static String createPayment() => '$baseUrl/payments';
  static String refundPayment(String paymentId) => '$baseUrl/payments/$paymentId/refunds';
  static String paymentPrediction() => '$baseUrl/predict';
  static String postReceiver() => '$baseUrl/receivers';
  static String paymentMethods(String id) => '$baseUrl/merchants/$id/paymentMethods';
}