/// Where the session token lives (FR-SE-06, UC-03 AF-05).
///
/// Secure storage on desktop and Android, memory on the web — and, when a
/// desktop or Android device's secure storage is unavailable and the user
/// chose to continue anyway, memory for the rest of this run. It never falls
/// back to preferences or a file.
///
/// The session controller writes through this store and the HTTP client reads
/// through it, so a token held in memory for the run is attached exactly like
/// a stored one.
library;

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../storage/secure_store.dart';

/// Keeps the session token.
class SessionTokenStore {
  SessionTokenStore(this._secureStore);

  final SecureStore _secureStore;

  /// The token held for this run only, when secure storage could not keep it.
  String? _runToken;

  /// The current token, or `null`. An unavailable secure store reads as no
  /// token rather than an error: a device without one can still sign in.
  Future<String?> read() async {
    final runToken = _runToken;
    if (runToken != null) return runToken;
    try {
      return await _secureStore.read(SecureKey.sessionToken);
    } on SecureStoreUnavailableException {
      return null;
    }
  }

  /// Keeps [token] in secure storage. Throws [SecureStoreUnavailableException]
  /// when the platform cannot, so the caller can ask the user what to do.
  Future<void> keep(String token) async {
    await _secureStore.write(SecureKey.sessionToken, token);
    _runToken = null;
  }

  /// Holds [token] in memory until [clear] or the end of the process. Only
  /// after the user accepted that the session will not be kept.
  void holdForThisRun(String token) => _runToken = token;

  /// Forgets the token wherever it is. Not an error when there is none, nor
  /// when secure storage is unavailable — then nothing was ever written there.
  Future<void> clear() async {
    _runToken = null;
    try {
      await _secureStore.delete(SecureKey.sessionToken);
    } on SecureStoreUnavailableException {
      return;
    }
  }
}

/// The session token store, over this target's secure store.
final sessionTokenStoreProvider = Provider<SessionTokenStore>(
  (ref) => SessionTokenStore(ref.watch(secureStoreProvider)),
);
