import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'cache_module_method_channel.dart';

abstract class CacheModulePlatform extends PlatformInterface {
  /// Constructs a CacheModulePlatform.
  CacheModulePlatform() : super(token: _token);

  static final Object _token = Object();

  static CacheModulePlatform _instance = MethodChannelCacheModule();

  /// The default instance of [CacheModulePlatform] to use.
  ///
  /// Defaults to [MethodChannelCacheModule].
  static CacheModulePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CacheModulePlatform] when
  /// they register themselves.
  static set instance(CacheModulePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
