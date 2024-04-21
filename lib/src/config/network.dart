import 'package:dio/dio.dart';

import 'network_path.dart';

class Network {
  final Dio dio = Dio(BaseOptions(
    baseUrl: NetworkPath.baseUrl,
    connectTimeout: const Duration(milliseconds: 5000),
    receiveTimeout: const Duration(milliseconds: 3000),
  ));
}