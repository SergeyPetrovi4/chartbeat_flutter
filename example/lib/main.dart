import 'package:flutter/material.dart';
import 'package:chartbeat_flutter/chartbeat_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _chartbeatFlutterPlugin = ChartbeatFlutter();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await _chartbeatFlutterPlugin.initializeTracker(
              '12345',
              'yourwebsite.com',
            );
            _chartbeatFlutterPlugin.trackView('https://google.com', 'Google');
          },
        ),
      ),
    );
  }
}
