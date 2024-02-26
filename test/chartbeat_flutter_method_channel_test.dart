import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:chartbeat_flutter/chartbeat_flutter_method_channel.dart';

void main() {
  MethodChannelChartbeatFlutter platform = MethodChannelChartbeatFlutter();
  const MethodChannel channel = MethodChannel('chartbeat_flutter');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
