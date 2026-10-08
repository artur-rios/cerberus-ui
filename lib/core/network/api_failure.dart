/// Turns a failed request into a [Failure] (FR-DA-03, FR-DA-06).
///
/// The API's own reason is kept wherever it sent one — never substituted,
/// softened or generalized. A message is supplied only where the API said
/// nothing at all, such as a timeout, because then there is no API reason to
/// show.
library;

import 'package:dio/dio.dart';

import '../result/result.dart';

/// The [Failure] for [exception], carrying the API's reason when it gave one.
Failure<T> failureFromDioException<T>(DioException exception) {
  final status = exception.response?.statusCode;
  final apiMessage = messageFromResponse(exception.response?.data);

  final kind = switch (status) {
    400 || 422 => FailureKind.invalidInput,
    401 => FailureKind.unauthenticated,
    403 => FailureKind.forbidden,
    404 => FailureKind.notFound,
    409 || 412 => FailureKind.conflict,
    null => FailureKind.unreachable,
    _ => FailureKind.serverError,
  };

  final message =
      apiMessage ??
      switch (exception.type) {
        DioExceptionType.connectionTimeout ||
        DioExceptionType.sendTimeout ||
        DioExceptionType.receiveTimeout =>
          'The instance did not respond in time.',
        DioExceptionType.connectionError =>
          'The instance could not be reached.',
        _ => 'The request could not be completed.',
      };

  return Failure<T>(message: message, kind: kind);
}

/// Reads the reason out of the API's `DataOutput` envelope, or `null`.
///
/// A refusal's reasons travel in `errors`; `messages` carries informational
/// text and is only a fallback for a failure that stated no error.
String? messageFromResponse(Object? data) {
  if (data is! Map) return null;

  for (final key in const ['errors', 'messages']) {
    final entries = data[key];
    if (entries is List && entries.isNotEmpty) {
      final joined = entries
          .whereType<String>()
          .where((entry) => entry.trim().isNotEmpty)
          .join(' ');
      if (joined.isNotEmpty) return joined;
    }
  }

  return null;
}
