import 'package:cerberus_ui/app/screen_security.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('enableScreenSecurity', () {
    late List<String> calls;

    setUp(() {
      calls = [];
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(screenSecurityChannel, (call) async {
            calls.add(call.method);
            return null;
          });
      addTearDown(
        () => TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
            .setMockMethodCallHandler(screenSecurityChannel, null),
      );
    });

    test('Given Android '
        'When screen security is enabled '
        'Then the runner is asked to set FLAG_SECURE (IR-17)', () async {
      await enableScreenSecurity(
        platform: TargetPlatform.android,
        isWeb: false,
      );

      expect(calls, ['enable']);
    });

    for (final platform in [TargetPlatform.windows, TargetPlatform.linux]) {
      test('Given $platform '
          'When screen security is enabled '
          'Then no platform is asked', () async {
        await enableScreenSecurity(platform: platform, isWeb: false);

        expect(calls, isEmpty);
      });
    }

    test('Given the web '
        'When screen security is enabled '
        'Then no platform is asked', () async {
      await enableScreenSecurity(platform: TargetPlatform.android, isWeb: true);

      expect(calls, isEmpty);
    });
  });
}
