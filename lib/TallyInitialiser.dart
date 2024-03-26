import 'package:flutter/services.dart';

class TallyInitialiser {
  static const platform = MethodChannel('com.fundall.gettallysdkui');

  static Future<void> initializeSdk() async {
    try {
      await platform.invokeMethod('initializeSdk');
    } on PlatformException catch (e) {
      print("Failed to initialize SDK: '${e.message}'.");
    }
  }
}