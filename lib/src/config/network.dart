import 'package:dio/dio.dart';

class Network {
  final Dio dio = Dio(BaseOptions(
    baseUrl: 'https://khipu.com/api/2.0',
    connectTimeout: const Duration(milliseconds: 5000),
    receiveTimeout: const Duration(milliseconds: 3000),
  ));
}