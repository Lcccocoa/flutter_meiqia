import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_meiqia_method_channel.dart';

abstract class FlutterMeiqiaPlatform extends PlatformInterface {
  /// Constructs a FlutterMeiqiaPlatform.
  FlutterMeiqiaPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterMeiqiaPlatform _instance = MethodChannelFlutterMeiqia();

  /// The default instance of [FlutterMeiqiaPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterMeiqia].
  static FlutterMeiqiaPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterMeiqiaPlatform] when
  /// they register themselves.
  static set instance(FlutterMeiqiaPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// 初始化美洽sdk
  Future<void> initMeiqiaSdkWith(String appkey) async {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  /// 初始化聊天页面 isPush 为 iOS 跳转方式 默认present
  Future<void> toChat({bool isPush = false}) async {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
