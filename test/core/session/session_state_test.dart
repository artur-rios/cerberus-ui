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

    test('Given a restored session '
        'When it is compared and printed '
        'Then it names no account and equals only another such session', () {
      expect(const SignedIn(accountId: null), const SignedIn(accountId: null));
      expect(
        const SignedIn(accountId: null),
        isNot(const SignedIn(accountId: 'a')),
      );
      expect(const SignedIn(accountId: null).toString(), 'SignedIn(null)');
    });
  });

  group('SessionState hash codes', () {
    test('Given equal pending challenges, and two signed-out states '
        'When their hash codes are read '
        'Then each pair has the same hash code', () {
      expect(const SignedOut().hashCode, const SignedOut().hashCode);
      expect(
        const ChallengePending(challengeToken: 't', methods: ['totp']).hashCode,
        const ChallengePending(challengeToken: 't', methods: ['totp']).hashCode,
      );
    });

    test('Given a state of each kind '
        'When each is compared with the others '
        'Then no two are equal', () {
      const states = <SessionState>[
        SignedOut(),
        ChallengePending(challengeToken: 't', methods: ['totp']),
        SignedIn(accountId: 'a'),
      ];

      for (final (i, a) in states.indexed) {
        for (final (j, b) in states.indexed) {
          if (i != j) expect(a, isNot(b), reason: '$a against $b');
        }
      }
    });
  });
}
