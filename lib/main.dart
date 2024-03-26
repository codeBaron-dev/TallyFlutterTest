import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Trigger SDK Example'),
        ),
        body: Center(
          child: SDKTriggerButton(),
        ),
      ),
    );
  }
}

class SDKTriggerButton extends StatelessWidget {
  // Define the method channel
  static const platform = MethodChannel('com.fundall.gettallysdkui');

  // Function to call the native method
  Future<void> triggerSdkFunction() async {
    try {
      final String result = await platform.invokeMethod('startTallyActivity', {
        // Pass any required arguments by your native method
        "email": "email@example.com",
        "password": "password",
        "fullName": "John Doe",
        // Add other parameters as needed
      });
      print(result); // Success result from native code
    } on PlatformException catch (e) {
      print("Failed to invoke the method: '${e.message}'.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        triggerSdkFunction(); // Call this function when the button is pressed
      },
      child: Text('Trigger SDK'),
    );
  }
}