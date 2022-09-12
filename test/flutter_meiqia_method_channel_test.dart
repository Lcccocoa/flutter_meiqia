import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_meiqia/flutter_meiqia_method_channel.dart';

void main() {
  MethodChannelFlutterMeiqia platform = MethodChannelFlutterMeiqia();
  const MethodChannel channel = MethodChannel('flutter_meiqia');

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
