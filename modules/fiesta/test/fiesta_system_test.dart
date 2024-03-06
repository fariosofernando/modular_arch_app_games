import 'package:flutter_test/flutter_test.dart';
import 'package:fiesta_system/fiesta_system.dart';
import 'package:fiesta_system/fiesta_system_platform_interface.dart';
import 'package:fiesta_system/fiesta_system_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFiestaSystemPlatform
    with MockPlatformInterfaceMixin
    implements FiestaSystemPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FiestaSystemPlatform initialPlatform = FiestaSystemPlatform.instance;

  test('$MethodChannelFiestaSystem is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFiestaSystem>());
  });

  test('getPlatformVersion', () async {
    FiestaSystem fiestaSystemPlugin = FiestaSystem();
    MockFiestaSystemPlatform fakePlatform = MockFiestaSystemPlatform();
    FiestaSystemPlatform.instance = fakePlatform;

    expect(await fiestaSystemPlugin.getPlatformVersion(), '42');
  });
}
