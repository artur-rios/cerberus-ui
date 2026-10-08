import 'package:cerberus_ui/core/logging/app_log.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppLog', () {
    late List<String> lines;

    setUp(() {
      lines = [];
      AppLog.sink = lines.add;
      addTearDown(AppLog.resetSink);
    });

    test('Given fields with secret-looking names '
        'When an event is logged '
        'Then their values are redacted and the rest are kept', () {
      AppLog.event('session.established', {
        'accountId': 'acct-1',
        'accessToken': 'TOKEN-MARKER',
        'password': 'PASSWORD-MARKER',
        'recovery_key': 'RECOVERY-MARKER',
        'envelope': 'ENVELOPE-MARKER',
        'Authorization': 'Bearer TOKEN-MARKER',
      });

      expect(lines.single, startsWith('session.established accountId=acct-1'));
      for (final marker in [
        'TOKEN-MARKER',
        'PASSWORD-MARKER',
        'RECOVERY-MARKER',
        'ENVELOPE-MARKER',
      ]) {
        expect(lines.single, isNot(contains(marker)));
      }
      expect(lines.single, contains(redacted));
    });

    test('Given an event with no fields '
        'When it is logged '
        'Then the line is the event name alone', () {
      AppLog.event('vault.locked');

      expect(lines, ['vault.locked']);
    });

    test('Given a silenced log, as in a release build '
        'When an event is logged '
        'Then nothing is written anywhere', () {
      AppLog.sink = null;

      AppLog.event('session.ended', {'accountId': 'acct-1'});

      expect(lines, isEmpty);
    });

    test('Given field names '
        'When they are classified '
        'Then each word of the name is checked, whatever the casing', () {
      expect(AppLog.isSensitive('sessionToken'), isTrue);
      expect(AppLog.isSensitive('content_key'), isTrue);
      expect(AppLog.isSensitive('requestBody'), isTrue);
      expect(AppLog.isSensitive('status'), isFalse);
      expect(AppLog.isSensitive('accountId'), isFalse);
    });
  });
}
