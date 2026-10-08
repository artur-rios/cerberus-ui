/// The leak recorder (IR-13, Testing Specification §6.4).
///
/// A content-bearing test seeds its plaintext with a distinctive marker, runs
/// the flow through the real code and these recording doubles, and asserts the
/// marker reached **none** of: a request (URL, headers or body), a local store
/// row, a preference write, a secure-storage write, or a log line. Secure
/// storage is where a token belongs, so a token test may expect it there and
/// nowhere else — see [expectOnlyIn].
library;

import 'package:cerberus_ui/core/local_store/local_store.dart';
import 'package:cerberus_ui/core/logging/app_log.dart';
import 'package:flutter_test/flutter_test.dart';

import 'recording_stores.dart';
import 'stub_http_adapter.dart';

/// Where a marker can be found.
enum LeakChannel {
  /// A request's URL or body.
  request,

  /// A request's headers — where, and only where, the session token belongs.
  requestHeader,
  localStore,
  preferences,
  secureStorage,
  log,
}

/// Records every way data can leave memory, and finds a marker in any of them.
class LeakRecorder {
  LeakRecorder() {
    AppLog.sink = logLines.add;
    addTearDown(AppLog.resetSink);
  }

  final adapter = StubHttpAdapter();
  final secureStore = RecordingSecureStore();
  final preferences = RecordingPreferencesStore();
  final List<String> logLines = [];

  /// Rows read from the local store by [captureLocalStore].
  final List<String> localStoreRows = [];

  /// Reads every row of every table in [store] into [localStoreRows].
  Future<void> captureLocalStore(LocalStore store) async {
    for (final table in store.allTables) {
      final rows = await store
          .customSelect('SELECT * FROM "${table.actualTableName}"')
          .get();
      for (final row in rows) {
        localStoreRows.add('${table.actualTableName}: ${row.data}');
      }
    }
  }

  /// The channels [marker] reached.
  Set<LeakChannel> channelsContaining(String marker) => {
    for (final request in adapter.requests) ...[
      if ('${request.uri} ${request.body}'.contains(marker))
        LeakChannel.request,
      if ('${request.headers}'.contains(marker)) LeakChannel.requestHeader,
    ],
    if (localStoreRows.any((row) => row.contains(marker)))
      LeakChannel.localStore,
    if (preferences.writes.any((write) => write.contains(marker)))
      LeakChannel.preferences,
    if (secureStore.writes.any((write) => write.contains(marker)))
      LeakChannel.secureStorage,
    if (logLines.any((line) => line.contains(marker))) LeakChannel.log,
  };

  /// Asserts [marker] reached no channel at all.
  void expectNoLeak(String marker) => expect(
    channelsContaining(marker),
    isEmpty,
    reason: 'the marker must not leave memory',
  );

  /// Asserts [marker] reached exactly [allowed] and nothing else.
  void expectOnlyIn(String marker, Set<LeakChannel> allowed) => expect(
    channelsContaining(marker),
    allowed,
    reason: 'the marker may reach only $allowed',
  );
}
