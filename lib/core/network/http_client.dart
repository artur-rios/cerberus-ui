/// The configured HTTP client (IR-09, FR-DA-04, FR-DA-12).
///
/// One `dio` instance, shared by every generated client, carrying the base
/// address, the timeouts and the bearer-token interceptor — and **no cache**:
/// no cache interceptor is ever added, and nothing stores a response outside
/// the local store. The token travels in the `Authorization` header and never
/// in a URL, where it would reach logs, history and referrers.
library;

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../config/instance_config.dart';
import '../session/session_controller.dart';
import '../session/session_token_store.dart';
import 'api_failure.dart';

/// How long to wait for a connection, and for each direction of a request.
const connectTimeout = Duration(seconds: 10);
const sendTimeout = Duration(seconds: 30);
const receiveTimeout = Duration(seconds: 30);

/// Builds the application's `dio` instance for [baseUrl].
///
/// [readToken] supplies the session token for each request, read fresh so a
/// sign-out takes effect on the very next one. [onUnauthenticated] is told when
/// the API rejects a token, so the session can end (`FR-SE-09`); the network
/// layer reports the fact and does not decide what to do about it, and nothing
/// is retried (`FR-SE-10`). Only a 401 stating `authentication_required` on a
/// request that carried a token rejects a session. A 401 on a request without
/// one — a refused password or second-factor code — rejected no session, and
/// neither did a 401 stating anything else, such as `vault_access_required`
/// for a valid session whose vault is locked; neither is reported. [adapter]
/// replaces the transport in tests.
Dio createHttpClient({
  required Uri baseUrl,
  required Future<String?> Function() readToken,
  void Function()? onUnauthenticated,
  HttpClientAdapter? adapter,
}) {
  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl.toString(),
      connectTimeout: connectTimeout,
      sendTimeout: sendTimeout,
      receiveTimeout: receiveTimeout,
      headers: const {'Accept': 'application/json'},
    ),
  );

  if (adapter != null) dio.httpClientAdapter = adapter;

  dio.interceptors.add(
    BearerTokenInterceptor(
      readToken: readToken,
      onUnauthenticated: onUnauthenticated,
    ),
  );

  return dio;
}

/// Attaches the session token to every request that has one, as a header.
class BearerTokenInterceptor extends Interceptor {
  BearerTokenInterceptor({required this.readToken, this.onUnauthenticated});

  final Future<String?> Function() readToken;
  final void Function()? onUnauthenticated;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await readToken();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.requestOptions.headers.containsKey('Authorization') &&
        isTokenRejection(err)) {
      onUnauthenticated?.call();
    }
    handler.next(err);
  }
}

/// The application's `dio` instance, built against the adopted instance.
///
/// Read only behind the route guard, which keeps every screen that makes a
/// request unreachable until an instance is adopted (UC-01).
final httpClientProvider = Provider<Dio>((ref) {
  final address = ref.watch(instanceConfigProvider);
  if (address == null) {
    throw StateError('No Cerberus API instance has been adopted.');
  }

  final tokens = ref.watch(sessionTokenStoreProvider);

  return createHttpClient(
    baseUrl: address.uri,
    readToken: tokens.read,
    onUnauthenticated: () => ref.read(sessionProvider.notifier).end(),
  );
});
