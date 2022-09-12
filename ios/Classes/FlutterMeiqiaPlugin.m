#import "FlutterMeiqiaPlugin.h"

#import <MeiQiaSDK/MQManager.h>
#import <Meiqia/MQChatViewManager.h>

@implementation FlutterMeiqiaPlugin

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    FlutterMethodChannel* channel = [FlutterMethodChannel
                                     methodChannelWithName:@"flutter_meiqia"
                                     binaryMessenger:[registrar messenger]];
    FlutterMeiqiaPlugin* instance = [[FlutterMeiqiaPlugin alloc] init];
    [registrar addMethodCallDelegate:instance channel:channel];
    [registrar addApplicationDelegate:instance];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if ([@"initMeiqiaSdk" isEqualToString:call.method]) {
        [self initSdk:call.arguments result:result];
    }else if ([@"toChat" isEqualToString:call.method]) {
        [self pushToMeiqiaVCWith:call.arguments];
        result(nil);
    }else {
        result(FlutterMethodNotImplemented);
    }
}

- (void)initSdk:(NSString *)appKey result:(FlutterResult)result{
    [MQManager initWithAppkey:appKey completion:^(NSString *clientId, NSError *error) {
        if (!error) {
            NSLog(@"美洽 SDK：初始化成功");
        } else {
            NSLog(@"error:%@",error);
        }
        result(nil);
    }];
}

- (void)pushToMeiqiaVCWith:(NSNumber* ) isPush{
    UIViewController *viewController = [UIApplication sharedApplication].delegate.window.rootViewController;
    MQChatViewManager *chatViewManager = [[MQChatViewManager alloc] init];
    [chatViewManager setoutgoingDefaultAvatarImage:[UIImage imageNamed:@"meiqia-icon"]];
    if (isPush.boolValue) {
        [chatViewManager pushMQChatViewControllerInViewController:viewController];
    }else {
        [chatViewManager presentMQChatViewControllerInViewController:viewController];
    }
}

#pragma mark - AppDelegate
- (void)applicationWillEnterForeground:(UIApplication *)application {
#pragma mark  集成第二步: 进入前台 打开meiqia服务
    [MQManager openMeiqiaService];
}
- (void)applicationDidEnterBackground:(UIApplication *)application {
#pragma mark  集成第三步: 进入后台 关闭美洽服务
    [MQManager closeMeiqiaService];
}
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
#pragma mark  集成第四步: 上传设备deviceToken
    [MQManager registerDeviceToken:deviceToken];
}

@end
