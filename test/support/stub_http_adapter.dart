/// A `dio` transport answering from memory (Testing Specification §6.2, §7.3).
///
/// No test reaches the network. Every request is recorded — its method, URL,
/// headers and body — which is what the plaintext-leak assertions read.
library;

import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';

/// One recorded request.
class RecordedRequest {
  RecordedRequest({
    required this.method,
    required this.uri,
    required this.headers,
    required this.body,
  });

  final String method;
  final Uri uri;
  final Map<String, Object?> headers;

  /// The body as sent, decoded as UTF-8; empty when there was none.
  final String body;
}

/// A canned answer.
class StubResponse {
  const StubResponse(this.statusCode, [this.json]);

  final int statusCode;
  final Object? json;
}

/// Answers each request with the response registered for `METHOD /path`, or
/// with a connection error when none is.
class StubHttpAdapter implements HttpClientAdapter {
  final Map<String, StubResponse> _responses = {};
  final List<RecordedRequest> requests = [];

  /// Registers [response] for [method] on [path].
  void on(String method, String path, StubResponse response) =>
      _responses['$method $path'] = response;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    final bytes = <int>[];
    if (requestStream != null) {
      await for (final chunk in requestStream) {
        bytes.addAll(chunk);
      }
    }

    requests.add(
      RecordedRequest(
        method: options.method,
        uri: options.uri,
        headers: Map.of(options.headers),
        body: utf8.decode(bytes),
      ),
    );

    final response = _responses['${options.method} ${options.uri.path}'];
    if (response == null) {
      throw DioException.connectionError(
        requestOptions: options,
        reason: 'No stub for ${options.method} ${options.uri.path}',
      );
    }

    return ResponseBody.fromString(
      response.json == null ? '' : jsonEncode(response.json),
      response.statusCode,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}
