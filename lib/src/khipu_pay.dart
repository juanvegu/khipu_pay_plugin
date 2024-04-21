import 'package:khipu_pay_plugin/src/config/key_mode.dart';
import 'package:khipu_pay_plugin/src/domain/khipu_credential.dart';
import 'package:khipu_pay_plugin/src/util/constants.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

final class KhipuPay {
  static KhipuPay get instance {
    assert(
      _instance._initialized,
      'You must initialize the KhipuPay instance before calling KhipuPay.instance',
    );
    return _instance;
  }

  KhipuPay._();
  static final KhipuPay _instance = KhipuPay._();

  bool _initialized = false;

  late final KhipuCredential credential;

  static Future<void> initialize({
    KeyMode keyMode = KeyMode.dartDefine,
    String? khipuId,
    String? khipuSecret,
  }) async {
    assert(
      !_instance._initialized,
      'This instance is already initialized',
    );

    switch (keyMode) {
      case KeyMode.normal:
        assert(
          khipuId != null && khipuSecret != null,
          'You must provide khipuId and khipuSecret when using KeyMode.normal',
        );

        _instance._init(khipuId!, khipuSecret!);
      case KeyMode.dartDefine:
        const identifier = String.fromEnvironment(Constants.khipuId, defaultValue: Constants.empty);
        const secret = String.fromEnvironment(Constants.khipuSecret, defaultValue: Constants.empty);

        assert(
          identifier != Constants.empty && secret != Constants.empty,
          'You must provide khipuId and khipuSecret in your environment when using KeyMode.dartDefine',
        );

        _instance._init(identifier, secret);
      case KeyMode.env:
        try {
          await dotenv.load();

          final identifier = dotenv.env[Constants.khipuId] ?? Constants.empty;
          final secret = dotenv.env[Constants.khipuSecret] ?? Constants.empty;

          assert(
            identifier != Constants.empty && secret != Constants.empty,
            'You must provide khipuId and khipuSecret in your .env file when using KeyMode.env',
          );

          _instance._init(identifier, secret);
        } catch (e) {
          assert(
            false,
            'You must provide a .env file when using KeyMode.env',
          );
        }
    }
  }

  void _init(
    String khipuId,
    String khipuSecret
  ) {
    credential = KhipuCredential(
      khipuId: khipuId, 
      khipuSecret: khipuSecret
    );

    _initialized = true;
  }
}