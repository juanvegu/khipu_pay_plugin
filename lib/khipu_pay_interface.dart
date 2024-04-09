import 'package:khipu_pay_plugin/src/config/key_mode.dart';

abstract class KhipuPayInterface {
  void initialize({ KeyMode keyMode = KeyMode.dartDefine });
}
