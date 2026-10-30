/// Build-time configuration (IR-14, FR-CF-01).
///
/// Everything here arrives by `--dart-define`, which means it is compiled into
/// an artifact users can read — on the web, into `main.dart.js`. **No secret is
/// ever configured this way.** The only compiled-in value is an address. The
/// session token is obtained at run time and lives only in secure storage, or
/// in memory on the web (`FR-SE-06`).
library;

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The configuration this build was compiled with.
@immutable
class AppConfig {
  const AppConfig({required this.apiBaseUrl, required this.allowPlainHttp});

  /// Reads the configuration from the values supplied at build time.
  ///
  /// An absent `CERBERUS_API_BASE_URL` reads as the empty string, which is not
  /// an error: it means this build names no default instance, and the
  /// application starts at the setup screen instead (UC-01).
  factory AppConfig.fromEnvironment() => const AppConfig(
    apiBaseUrl: String.fromEnvironment('CERBERUS_API_BASE_URL'),
    // Plain HTTP is a debug convenience for a locally running API, and nothing
    // more (FR-CF-02, NFR-03). It is decided by the build mode, never by a
    // define, so a release build cannot be talked into it.
    allowPlainHttp: kDebugMode,
  );

  /// The instance this build points at, or empty when it names none.
  final String apiBaseUrl;

  /// Whether an `http://` address is acceptable. True in debug builds only.
  final bool allowPlainHttp;

  /// Whether this build names a default instance.
  bool get hasDefaultInstance => apiBaseUrl.isNotEmpty;
}

/// The build's configuration. Overridden in tests.
final appConfigProvider = Provider<AppConfig>(
  (ref) => AppConfig.fromEnvironment(),
);
