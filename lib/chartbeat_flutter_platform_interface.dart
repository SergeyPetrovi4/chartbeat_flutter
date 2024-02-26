import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'chartbeat_flutter_method_channel.dart';

abstract class ChartbeatFlutterPlatform extends PlatformInterface {
  /// Constructs a ChartbeatFlutterPlatform.
  ChartbeatFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static ChartbeatFlutterPlatform _instance = MethodChannelChartbeatFlutter();

  /// The default instance of [ChartbeatFlutterPlatform] to use.
  ///
  /// Defaults to [MethodChannelChartbeatFlutter].
  static ChartbeatFlutterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ChartbeatFlutterPlatform] when
  /// they register themselves.
  static set instance(ChartbeatFlutterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('getPlatformVersion() has not been implemented.');
  }

  // Adds method for initializing the Chartbeat tracker.
  Future<void> initializeTracker(String accountID, String domain) {
    throw UnimplementedError('initializeTracker() has not been implemented.');
  }

  // Adds method for tracking views.
  Future<void> trackView(String viewId, String title) {
    throw UnimplementedError('trackView() has not been implemented.');
  }
}
