/// The application's only log (IR-15, FR-PV-02).
///
/// Debug builds write structured events to the developer console through
/// `developer.log`; release and profile builds write nothing at all. Nothing
/// is ever written to a file or sent anywhere (Operations & Infrastructure §4).
///
/// An event is a fixed name plus fields. Free text is deliberately not
/// accepted: a message assembled from values is how a token reaches a log.
/// Fields whose name suggests a secret are redacted, whatever their value.
library;

import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';

/// Where a formatted log line goes. Replaced in tests by the leak recorder.
typedef LogSink = void Function(String line);

/// Field names whose values are never written, compared case-insensitively
/// against each word of the field's name.
const _sensitiveWords = {
  'authorization',
  'body',
  'ciphertext',
  'code',
  'credential',
  'envelope',
  'key',
  'nonce',
  'password',
  'plaintext',
  'recovery',
  'secret',
  'tag',
  'token',
};

/// What a redacted value is written as.
const redacted = '[redacted]';

/// The application log.
abstract final class AppLog {
  static LogSink? _sink = _defaultSink();

  /// Records [event] with [fields], in a debug build only.
  ///
  /// [event] names what happened — `session.ended`, `request.failed` — and is
  /// never built from a value. [fields] carry identifiers and outcomes; any
  /// whose name looks like a secret is written as [redacted].
  static void event(String event, [Map<String, Object?> fields = const {}]) {
    final sink = _sink;
    if (sink == null) return;
    sink(format(event, fields));
  }

  /// Formats one log line, redacting sensitive fields.
  @visibleForTesting
  static String format(String event, Map<String, Object?> fields) {
    if (fields.isEmpty) return event;
    final rendered = fields.entries
        .map(
          (field) =>
              '${field.key}=${isSensitive(field.key) ? redacted : field.value}',
        )
        .join(' ');
    return '$event $rendered';
  }

  /// Whether a field named [name] may carry a secret.
  @visibleForTesting
  static bool isSensitive(String name) =>
      _words(name).any((word) => _sensitiveWords.contains(word.toLowerCase()));

  /// Replaces where lines go; `null` silences the log. Tests only.
  @visibleForTesting
  static set sink(LogSink? sink) => _sink = sink;

  /// Restores the build's own sink. Tests only.
  @visibleForTesting
  static void resetSink() => _sink = _defaultSink();

  /// A sink in debug builds; none in release or profile builds, so not even
  /// the formatting runs there.
  static LogSink? _defaultSink() =>
      kDebugMode ? (line) => developer.log(line, name: 'cerberus') : null;

  /// Splits `accessToken`, `access_token` or `access-token` into its words.
  static Iterable<String> _words(String name) => name
      .replaceAllMapped(RegExp('([a-z0-9])([A-Z])'), (m) => '${m[1]} ${m[2]}')
      .split(RegExp(r'[\s_\-.]+'))
      .where((word) => word.isNotEmpty);
}
