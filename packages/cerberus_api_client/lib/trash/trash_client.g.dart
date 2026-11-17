// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trash_client.dart';

// dart format off

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: type=lint
// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter,avoid_unused_constructor_parameters,unreachable_from_main,avoid_redundant_argument_values

class _TrashClient extends TrashClient {
  _TrashClient._(this._dio, Dio _transport, {this.baseUrl, this.errorLogger})
    : super._(_transport);

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<TrashListOutputDataOutput$Response> getApiTrash({
    Map<String, Object?> extra = const {},
    CancelToken? cancelToken,
    Options? options,
    String? pageSize,
    String? cursor,
    String? xCerberusVaultAccess,
  }) async {
    final _extra = <String, dynamic>{};
    _extra.addAll(extra);
    final queryParameters = <String, dynamic>{
      r'pageSize': pageSize,
      r'cursor': cursor,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{
      r'Accept': 'application/json',
      r'X-Cerberus-Vault-Access': xCerberusVaultAccess,
    };
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<TrashListOutputDataOutput$Response>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/trash',
            queryParameters: queryParameters,
            data: _data,
            cancelToken: cancelToken,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, Object?>>(_options);
    late TrashListOutputDataOutput$Response _value;
    try {
      _value = TrashListOutputDataOutput$Response.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<EmptyTrashOutputDataOutput$Response> deleteApiTrash({
    Map<String, Object?> extra = const {},
    CancelToken? cancelToken,
    Options? options,
    String? xCerberusVaultAccess,
    required EmptyTrashCommand body,
  }) async {
    final _extra = <String, dynamic>{};
    _extra.addAll(extra);
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{
      r'Accept': 'application/json',
      r'Content-Type': 'application/json',
      r'X-Cerberus-Vault-Access': xCerberusVaultAccess,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(body.toJson());
    final _options = _setStreamType<EmptyTrashOutputDataOutput$Response>(
      Options(
            method: 'DELETE',
            headers: _headers,
            extra: _extra,
            contentType: 'application/json',
          )
          .compose(
            _dio.options,
            '/api/trash',
            queryParameters: queryParameters,
            data: _data,
            cancelToken: cancelToken,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, Object?>>(_options);
    late EmptyTrashOutputDataOutput$Response _value;
    try {
      _value = EmptyTrashOutputDataOutput$Response.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<RestoreTrashOutputDataOutput$Response> postApiTrashByIdRestore({
    Map<String, Object?> extra = const {},
    CancelToken? cancelToken,
    Options? options,
    required String id,
    String? xCerberusVaultAccess,
    required RestoreTrashCommand body,
  }) async {
    final _extra = <String, dynamic>{};
    _extra.addAll(extra);
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{
      r'Accept': 'application/json',
      r'Content-Type': 'application/json',
      r'X-Cerberus-Vault-Access': xCerberusVaultAccess,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(body.toJson());
    final _options = _setStreamType<RestoreTrashOutputDataOutput$Response>(
      Options(
            method: 'POST',
            headers: _headers,
            extra: _extra,
            contentType: 'application/json',
          )
          .compose(
            _dio.options,
            '/api/trash/${id}/restore',
            queryParameters: queryParameters,
            data: _data,
            cancelToken: cancelToken,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, Object?>>(_options);
    late RestoreTrashOutputDataOutput$Response _value;
    try {
      _value = RestoreTrashOutputDataOutput$Response.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}

// dart format on
