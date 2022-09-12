import 'flutter_meiqia_platform_interface.dart';

class FlutterMeiqia {
  /// 初始化美洽sdk
  Future<void> initMeiqiaSdkWith(String appkey) async {
    return FlutterMeiqiaPlatform.instance.initMeiqiaSdkWith(appkey);
  }

  /// 初始化聊天页面 isPush 为 iOS 跳转方式 默认present
  Future<void> toChat({bool isPush = false}) async {
    return FlutterMeiqiaPlatform.instance.toChat(isPush: isPush);
  }
}
