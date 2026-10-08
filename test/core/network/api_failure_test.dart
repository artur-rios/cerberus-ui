import 'package:cerberus_ui/core/network/api_failure.dart';
import 'package:cerberus_ui/core/result/result.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

DioException _answered(int status, Object? data) {
  final options = RequestOptions(path: '/api/thing');
  return DioException.badResponse(
    statusCode: status,
    requestOptions: options,
    response: Response(requestOptions: options, statusCode: status, data: data),
  );
}

void main() {
  group('failureFromDioException', () {
    test('Given an API refusal carrying errors '
        'When it is translated '
        "Then the API's own reason is kept, word for word (FR-DA-06)", () {
      final failure = failureFromDioException<void>(
        _answered(400, {
          'errors': ['Email is invalid.', 'Password is required.'],
          'messages': ['ignored'],
        }),
      );

      expect(failure.message, 'Email is invalid. Password is required.');
      expect(failure.kind, FailureKind.invalidInput);
    });

    test('Given a refusal with only messages '
        'When it is translated '
        'Then the messages are the reason', () {
      expect(
        failureFromDioException<void>(
          _answered(409, {
            'errors': <String>[],
            'messages': ['Revision changed.'],
          }),
        ).message,
        'Revision changed.',
      );
    });

    final kinds = {
      400: FailureKind.invalidInput,
      422: FailureKind.invalidInput,
      401: FailureKind.unauthenticated,
      403: FailureKind.forbidden,
      404: FailureKind.notFound,
      409: FailureKind.conflict,
      412: FailureKind.conflict,
      500: FailureKind.serverError,
      503: FailureKind.serverError,
    };
    kinds.forEach((status, kind) {
      test('Given status $status '
          'When it is translated '
          'Then it is $kind', () {
        expect(
          failureFromDioException<void>(_answered(status, null)).kind,
          kind,
        );
      });
    });

    test(
      'Given a timeout '
      'When it is translated '
      'Then it is unreachable, with a message because the API said nothing',
      () {
        final failure = failureFromDioException<void>(
          DioException.connectionTimeout(
            timeout: const Duration(seconds: 1),
            requestOptions: RequestOptions(path: '/'),
          ),
        );

        expect(failure.kind, FailureKind.unreachable);
        expect(failure.message, 'The instance did not respond in time.');
      },
    );

    test('Given a connection error '
        'When it is translated '
        'Then it is unreachable', () {
      final failure = failureFromDioException<void>(
        DioException.connectionError(
          requestOptions: RequestOptions(path: '/'),
          reason: 'refused',
        ),
      );

      expect(failure.kind, FailureKind.unreachable);
      expect(failure.message, 'The instance could not be reached.');
    });

    test('Given a body that is not the API envelope '
        'When the reason is read '
        'Then there is none', () {
      expect(messageFromResponse('text'), isNull);
      expect(
        messageFromResponse({
          'errors': ['  '],
        }),
        isNull,
      );
    });
  });
}
