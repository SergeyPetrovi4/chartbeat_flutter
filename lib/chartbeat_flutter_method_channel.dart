import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'chartbeat_flutter_platform_interface.dart';

/// An implementation of [ChartbeatFlutterPlatform] that uses method channels.
class MethodChannelChartbeatFlutter extends ChartbeatFlutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('chartbeat_flutter');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
