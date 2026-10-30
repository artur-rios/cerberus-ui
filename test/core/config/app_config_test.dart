import 'package:cerberus_ui/core/config/app_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppConfig', () {
    test('Given a build with no CERBERUS_API_BASE_URL '
        'When the configuration is read '
        'Then it names no default instance, so start-up goes to setup', () {
      final config = AppConfig.fromEnvironment();

      expect(config.apiBaseUrl, isEmpty);
      expect(config.hasDefaultInstance, isFalse);
    });

    test('Given the build mode '
        'When the configuration is read '
        'Then plain HTTP is allowed exactly when this is a debug build', () {
      expect(AppConfig.fromEnvironment().allowPlainHttp, kDebugMode);
    });

    test('Given an address '
        'When a configuration carries it '
        'Then it names a default instance', () {
      const config = AppConfig(
        apiBaseUrl: 'https://vault.example',
        allowPlainHttp: false,
      );

      expect(config.hasDefaultInstance, isTrue);
    });
  });
}
