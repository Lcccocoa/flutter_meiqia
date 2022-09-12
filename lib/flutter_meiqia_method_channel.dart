import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_meiqia_platform_interface.dart';

/// An implementation of [FlutterMeiqiaPlatform] that uses method channels.
class MethodChannelFlutterMeiqia extends FlutterMeiqiaPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_meiqia');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  /// 初始化美洽sdk
  Future<void> initMeiqiaSdkWith(String appkey) async {
    await methodChannel.invokeMethod('initMeiqiaSdk', appkey);
  }

  /// 初始化聊天页面 isPush 为 iOS 跳转方式 默认present
  Future<void> toChat({bool isPush = false}) async {
    await methodChannel.invokeMethod('toChat', isPush);
  }
}
