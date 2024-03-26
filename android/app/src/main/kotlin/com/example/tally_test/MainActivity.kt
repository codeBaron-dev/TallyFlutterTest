package com.example.tally_test

import com.netplus.qrenginui.activities.TallyActivity
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.fundall.gettallysdkui"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                call, result ->
            if (call.method == "startTallyActivity") {
                val email = call.argument<String>("email")
                val password = call.argument<String>("password")
                val fullName = call.argument<String>("fullName")
                val bankName = call.argument<String>("bankName")
                val phoneNumber = call.argument<String>("phoneNumber")
                val userId = call.argument<String>("userId")
                val intent = TallyActivity.getIntent(
                    this,
                    "nicholasanyanwu17@gmail.com",
                    "12345678",
                    "Anyanwu Nicholas",
                    "GTBank",
                    "09026759627",
                    "21")
                startActivity(intent)
                result.success("Tally Activity Started")
            } else {
                result.notImplemented()
            }
        }
    }
}