import 'package:cerberus_ui/core/session/session_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SessionState', () {
    test('Given a pending challenge '
        'When it is turned into a string '
        'Then the challenge reference is not printed', () {
      const state = ChallengePending(
        challengeToken: 'CHALLENGE-MARKER',
        methods: ['totp'],
      );

      expect(state.toString(), isNot(contains('CHALLENGE-MARKER')));
      expect(state.toString(), contains('totp'));
    });

    test('Given two challenges differing only in methods '
        'When they are compared '
        'Then they differ', () {
      expect(
        const ChallengePending(challengeToken: 't', methods: ['totp']),
        isNot(const ChallengePending(challengeToken: 't', methods: ['email'])),
      );
    });

    test('Given equal states '
        'When they are compared '
        'Then they are equal, hash codes included', () {
      expect(const SignedOut(), const SignedOut());
      expect(const SignedIn(accountId: 'a'), const SignedIn(accountId: 'a'));
      expect(
        const SignedIn(accountId: 'a').hashCode,
        const SignedIn(accountId: 'a').hashCode,
      );
    });
  });
}
