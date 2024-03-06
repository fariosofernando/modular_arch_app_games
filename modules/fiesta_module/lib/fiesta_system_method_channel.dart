import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'fiesta_system_platform_interface.dart';

/// An implementation of [FiestaSystemPlatform] that uses method channels.
class MethodChannelFiestaSystem extends FiestaSystemPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('fiesta_system');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
