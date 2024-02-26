import 'package:flutter_test/flutter_test.dart';
import 'package:chartbeat_flutter/chartbeat_flutter.dart';
import 'package:chartbeat_flutter/chartbeat_flutter_platform_interface.dart';
import 'package:chartbeat_flutter/chartbeat_flutter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockChartbeatFlutterPlatform
    with MockPlatformInterfaceMixin
    implements ChartbeatFlutterPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ChartbeatFlutterPlatform initialPlatform = ChartbeatFlutterPlatform.instance;

  test('$MethodChannelChartbeatFlutter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelChartbeatFlutter>());
  });

  test('getPlatformVersion', () async {
    ChartbeatFlutter chartbeatFlutterPlugin = ChartbeatFlutter();
    MockChartbeatFlutterPlatform fakePlatform = MockChartbeatFlutterPlatform();
    ChartbeatFlutterPlatform.instance = fakePlatform;

    expect(await chartbeatFlutterPlugin.getPlatformVersion(), '42');
  });
}
