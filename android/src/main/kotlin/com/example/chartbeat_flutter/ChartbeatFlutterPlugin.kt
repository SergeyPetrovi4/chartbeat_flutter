package com.example.chartbeat_flutter

import android.content.Context
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import com.chartbeat.androidsdk.Tracker

class ChartbeatFlutterPlugin: FlutterPlugin, MethodCallHandler {
  private lateinit var channel: MethodChannel
  private var _flutterPluginBinding: FlutterPlugin.FlutterPluginBinding? = null // Backing field for safe access
  private val flutterPluginBinding: FlutterPlugin.FlutterPluginBinding
    get() = _flutterPluginBinding ?: throw IllegalStateException("FlutterPluginBinding is not initialized")

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    this._flutterPluginBinding = flutterPluginBinding
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "chartbeat_flutter")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    when (call.method) {
      "getPlatformVersion" -> {
        result.success("Android ${android.os.Build.VERSION.RELEASE}")
      }
      "initializeTracker" -> {
        val accountID = call.argument<String>("accountID") ?: return result.error("NULL_ACCOUNT_ID", "Account ID is null", null)
        val domain = call.argument<String>("domain") ?: return result.error("NULL_DOMAIN", "Domain is null", null)
        initializeTracker(accountID, domain, flutterPluginBinding.applicationContext)
        result.success(null)
      }
      "trackView" -> {
        val viewId = call.argument<String>("viewId") ?: return result.error("NULL_VIEW_ID", "View ID is null", null)
        val title = call.argument<String>("title") ?: return result.error("NULL_TITLE", "Title is null", null)
        trackView(viewId, title)
        result.success(null)
      }
      else -> {
        result.notImplemented()
      }
    }
  }

  private fun initializeTracker(accountID: String, domain: String, context: Context) {
    Tracker.setupTracker(accountID, domain, context)
  }

  private fun trackView(viewId: String, title: String) {
    Tracker.trackView(flutterPluginBinding.applicationContext, viewId, title)
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
    _flutterPluginBinding = null // Clear the binding reference
  }
}
