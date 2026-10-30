import 'package:cerberus_ui/core/session/session_notice.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

ProviderContainer _container() {
  final container = ProviderContainer();
  addTearDown(container.dispose);
  return container;
}

void main() {
  group('SessionNoticeController', () {
    test('Given a new application '
        'When the notices are read '
        'Then there are none', () {
      final container = _container();

      expect(container.read(sessionNoticeProvider), isEmpty);
    });

    test('Given no notices '
        'When two are posted, one of them twice '
        'Then each is held once, in the order posted', () {
      final container = _container();
      final notices = container.read(sessionNoticeProvider.notifier);

      notices
        ..post(SessionNotice.sessionEnded)
        ..post(SessionNotice.tokenNotDeleted)
        ..post(SessionNotice.sessionEnded);

      expect(container.read(sessionNoticeProvider).toList(), [
        SessionNotice.sessionEnded,
        SessionNotice.tokenNotDeleted,
      ]);
    });

    test('Given two notices '
        'When the user dismisses one '
        'Then only the other remains', () {
      final container = _container();
      final notices = container.read(sessionNoticeProvider.notifier)
        ..post(SessionNotice.sessionEnded)
        ..post(SessionNotice.vaultNotRemoved);

      notices.dismiss(SessionNotice.sessionEnded);

      expect(container.read(sessionNoticeProvider), {
        SessionNotice.vaultNotRemoved,
      });
    });

    test('Given notices '
        'When they are cleared '
        'Then none remain', () {
      final container = _container();
      final notices = container.read(sessionNoticeProvider.notifier)
        ..post(SessionNotice.tokenNotDeleted);

      notices.clear();

      expect(container.read(sessionNoticeProvider), isEmpty);
    });
  });
}
