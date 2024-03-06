import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'cache_module_platform_interface.dart';

/// An implementation of [CacheModulePlatform] that uses method channels.
class MethodChannelCacheModule extends CacheModulePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('cache_module');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
