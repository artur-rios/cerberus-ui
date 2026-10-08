package com.arturrios.cerberus_ui

import android.view.WindowManager
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

/**
 * The Android runner.
 *
 * Answers the application's own screen-security channel (IR-17, FR-PV-03): on
 * `enable`, it sets FLAG_SECURE, which keeps every screen out of screenshots
 * and the recent-apps preview. No package stands between the application and
 * the window.
 */
class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "enable" -> {
                        window.addFlags(WindowManager.LayoutParams.FLAG_SECURE)
                        result.success(null)
                    }
                    else -> result.notImplemented()
                }
            }
    }

    private companion object {
        const val CHANNEL = "com.arturrios.cerberus_ui/screen_security"
    }
}
