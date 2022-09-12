import 'package:flutter_meiqia/flutter_meiqia_method_channel.dart';
import 'package:flutter_meiqia/flutter_meiqia_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterMeiqiaPlatform
    with MockPlatformInterfaceMixin
    implements FlutterMeiqiaPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<void> initMeiqiaSdkWith(String appkey) {
    // TODO: implement initMeiqiaSdkWith
    throw UnimplementedError();
  }

  @override
  Future<void> toChat({bool isPush = false}) {
    // TODO: implement toChat
    throw UnimplementedError();
  }
}

void main() {
  final FlutterMeiqiaPlatform initialPlatform = FlutterMeiqiaPlatform.instance;

  test('$MethodChannelFlutterMeiqia is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterMeiqia>());
  });
}
