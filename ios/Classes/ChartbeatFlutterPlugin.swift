import Flutter
import UIKit
import Chartbeat

public class SwiftMyChartbeatPlugin: NSObject, FlutterPlugin {
  private var chartbeatTracker: CBTracker?

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "my_chartbeat_plugin", binaryMessenger: registrar.messenger())
    let instance = SwiftMyChartbeatPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "initializeTracker":
      guard let args = call.arguments as? [String: Any],
            let accountID = args["accountID"] as? String,
            let domain = args["domain"] as? String else {
              result(FlutterError(code: "INVALID_ARGUMENTS", message: "Invalid arguments for initializing tracker", details: nil))
              return
            }
      initializeTracker(accountID: accountID, domain: domain)
      result(nil)
    case "trackView":
      guard let args = call.arguments as? [String: Any],
            let viewId = args["viewId"] as? String,
            let title = args["title"] as? String else {
              result(FlutterError(code: "BAD_ARGS", message: "Missing or invalid arguments for tracking view", details: nil))
              return
            }
      trackView(viewId: viewId, title: title, result: result)
    default:
      result(FlutterMethodNotImplemented)
    }
  }

 private func initializeTracker(accountID: String, domain: String) {
    CBTracker.shared().setupTracker(withAccountId: Int(accountID) ?? 0, domain: domain)
}

  private func trackView(viewId: String, title: String, result: @escaping FlutterResult) {
    guard let tracker = chartbeatTracker else {
      result(FlutterError(code: "TRACKER_NOT_INITIALIZED", message: "Chartbeat tracker is not initialized.", details: nil))
      return
    }
    let dummyView = UIView()

    tracker.trackView(dummyView, viewId: viewId, title: title)
    result(nil) // Signal successful view tracking after ensuring tracker is initialized
  }
}