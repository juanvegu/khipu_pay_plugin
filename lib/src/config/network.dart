import 'package:dio/dio.dart';
import 'package:khipu_pay_plugin/src/domain/khipu_credential.dart';
import 'package:khipu_pay_plugin/src/util/constants.dart';

import 'network_path.dart';

class Network {
  final KhipuCredential _credential;
  
  final Dio _dio = Dio(BaseOptions(
    baseUrl: NetworkPath.baseUrl,
    connectTimeout: const Duration(milliseconds: 5000),
    receiveTimeout: const Duration(milliseconds: 3000),
  ));

  Dio get dio {
    final Map<String, dynamic> headers = {
      Constants.contentType: Headers.jsonContentType,
      Constants.apiKey: _credential.apiKey,
    };

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers.addAll(headers);
        return handler.next(options);
      },
    ));

    return _dio;
  }

  Network({required KhipuCredential credential}) : _credential = credential;
}