import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'fiesta_system_method_channel.dart';

abstract class FiestaSystemPlatform extends PlatformInterface {
  /// Constructs a FiestaSystemPlatform.
  FiestaSystemPlatform() : super(token: _token);

  static final Object _token = Object();

  static FiestaSystemPlatform _instance = MethodChannelFiestaSystem();

  /// The default instance of [FiestaSystemPlatform] to use.
  ///
  /// Defaults to [MethodChannelFiestaSystem].
  static FiestaSystemPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FiestaSystemPlatform] when
  /// they register themselves.
  static set instance(FiestaSystemPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
