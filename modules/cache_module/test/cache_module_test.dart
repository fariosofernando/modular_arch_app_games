import 'package:flutter_test/flutter_test.dart';
import 'package:cache_module/cache_module.dart';
import 'package:cache_module/cache_module_platform_interface.dart';
import 'package:cache_module/cache_module_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockCacheModulePlatform
    with MockPlatformInterfaceMixin
    implements CacheModulePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final CacheModulePlatform initialPlatform = CacheModulePlatform.instance;

  test('$MethodChannelCacheModule is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelCacheModule>());
  });

  test('getPlatformVersion', () async {
    CacheModule cacheModulePlugin = CacheModule();
    MockCacheModulePlatform fakePlatform = MockCacheModulePlatform();
    CacheModulePlatform.instance = fakePlatform;

    expect(await cacheModulePlugin.getPlatformVersion(), '42');
  });
}
