import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zoom/zoom.dart';

void main() {
  const MethodChannel channel = MethodChannel('zoom');

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
    Zoom grZoomPlugin = Zoom();
    expect(await grZoomPlugin.getPlatformVersion(), '42');
  });
}