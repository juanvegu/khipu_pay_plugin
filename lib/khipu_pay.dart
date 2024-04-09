import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:khipu_pay_plugin/khipu_pay_interface.dart';
import 'package:khipu_pay_plugin/src/config/key_mode.dart';
import 'package:khipu_pay_plugin/src/util/constants.dart';

final class KhipuPay implements KhipuPayInterface {
  static late final String khipuID;
  static late final String khipuSecret;

  @override
  void initialize({KeyMode keyMode = KeyMode.dartDefine}) {
    switch (keyMode) {
      case KeyMode.dartDefine:
        khipuID = const String.fromEnvironment(Constants.khipuId, defaultValue: Constants.empty);
        khipuSecret = const String.fromEnvironment(Constants.khipuSecret, defaultValue: Constants.empty);
      case KeyMode.env:
        khipuID = dotenv.env[Constants.khipuId] ?? Constants.empty;
        khipuSecret = dotenv.env[Constants.khipuSecret] ?? Constants.empty;
      default:
        break;
    }
  }
}
