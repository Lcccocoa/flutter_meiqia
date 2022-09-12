package com.example.flutter_meiqia;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** FlutterMeiqiaPlugin */
public class FlutterMeiqiaPlugin implements FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "flutter_meiqia");
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("initMeiqiaSdk")) {
      setup(call, result);
    } else if (call.method.equals("toChat")) {
      toChat(call, result);
    } else {
      result.notImplemented();
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }

  public void setup(MethodCall call, Result result) {
    MQManager.setDebugMode(true);
    String meiqiaKey = call.arguments.toString();
    MQConfig.init(registrar.context(), meiqiaKey, new OnInitCallback() {
      @Override
      public void onSuccess(String clientId) {
      }
      @Override
      public void onFailure(int code, String message) {
      }
    });
  }

  public void toChat(MethodCall call, Result result) {
    Intent intent = new MQIntentBuilder(registrar.context()).build();
    registrar.context().startActivity(intent);
  }
}
