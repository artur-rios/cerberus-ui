import 'package:cerberus_ui/core/result/result.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Result', () {
    test('Given a success '
        'When it is mapped '
        'Then the value is transformed', () {
      const Result<int> result = Success(2);

      final mapped = result.map((value) => value * 3);

      expect(mapped, const Success(6));
      expect(mapped.valueOrNull, 6);
      expect(mapped.isSuccess, isTrue);
    });

    test('Given a failure '
        'When it is mapped '
        'Then the reason and kind are carried through untouched', () {
      const Result<int> result = Failure(
        message: 'The API said no.',
        kind: FailureKind.forbidden,
      );

      final mapped = result.map((value) => '$value');

      expect(
        mapped,
        const Failure<String>(
          message: 'The API said no.',
          kind: FailureKind.forbidden,
        ),
      );
      expect(mapped.valueOrNull, isNull);
      expect(mapped.isSuccess, isFalse);
    });

    test('Given a success carrying a secret '
        'When it is turned into a string '
        'Then the value is not printed', () {
      const result = Success('SECRET-MARKER');

      expect(result.toString(), isNot(contains('SECRET-MARKER')));
    });

    test('Given two failures with the same reason and kind '
        'When they are compared '
        'Then they are equal', () {
      expect(
        const Failure<int>(message: 'm', kind: FailureKind.conflict),
        const Failure<int>(message: 'm', kind: FailureKind.conflict),
      );
      expect(
        const Failure<int>(message: 'm', kind: FailureKind.conflict).hashCode,
        const Failure<int>(message: 'm', kind: FailureKind.conflict).hashCode,
      );
    });
  });
}
