import 'package:flutter_test/flutter_test.dart';
import 'package:khipu_pay_plugin/khipu_pay_plugin.dart';
import 'package:khipu_pay_plugin/khipu_pay_plugin_platform_interface.dart';
import 'package:khipu_pay_plugin/khipu_pay_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockKhipuPayPluginPlatform
    with MockPlatformInterfaceMixin
    implements KhipuPayPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final KhipuPayPluginPlatform initialPlatform = KhipuPayPluginPlatform.instance;

  test('$MethodChannelKhipuPayPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelKhipuPayPlugin>());
  });

  test('getPlatformVersion', () async {
    KhipuPayPlugin khipuPayPlugin = KhipuPayPlugin();
    MockKhipuPayPluginPlatform fakePlatform = MockKhipuPayPluginPlatform();
    KhipuPayPluginPlatform.instance = fakePlatform;

    expect(await khipuPayPlugin.getPlatformVersion(), '42');
  });
}
