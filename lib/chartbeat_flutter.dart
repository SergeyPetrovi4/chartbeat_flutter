import 'chartbeat_flutter_platform_interface.dart';

class ChartbeatFlutter {
  // Initializes the Chartbeat tracker with the given account ID and domain.
  Future<void> initializeTracker(String accountID, String domain) {
    return ChartbeatFlutterPlatform.instance
        .initializeTracker(accountID, domain);
  }

  // Tracks a view with the specified view ID and title.
  Future<void> trackView(String viewId, String title) {
    return ChartbeatFlutterPlatform.instance.trackView(viewId, title);
  }
}
