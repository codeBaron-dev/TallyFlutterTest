import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Tally extends StatelessWidget {
  // Define the method channel
  static const platform = MethodChannel('com.fundall.gettallysdkui');

  // Method to call the native function
  Future<void> startTallyActivity() async {
    try {
      final String result = await platform.invokeMethod('startTallyActivity', {
        "email": "email@example.com",
        "password": "yourPassword",
        "fullName": "Your Full Name",
        "bankName": "Your Bank Name",
        "phoneNumber": "Your Phone Number",
        "userId": "Your UserID",
      });
      print(result);
    } on PlatformException catch (e) {
      print("Failed to invoke method: '${e.message}'.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        startTallyActivity();
      },
      child: Text('Start Tally Activity'),
    );
  }
}