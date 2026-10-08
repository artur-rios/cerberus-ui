import 'package:cerberus_ui/core/config/instance_address.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('InstanceAddress.parse', () {
    test('Given an HTTPS URL '
        'When it is parsed '
        'Then it is accepted, without a trailing slash', () {
      final result = InstanceAddress.parse(
        ' https://vault.example/api/ ',
        allowPlainHttp: false,
      );

      expect(result.problem, isNull);
      expect(result.address.toString(), 'https://vault.example/api');
    });

    test('Given an HTTP URL in a build that forbids plain HTTP '
        'When it is parsed '
        'Then it is refused as plain HTTP', () {
      final result = InstanceAddress.parse(
        'http://localhost:5000',
        allowPlainHttp: false,
      );

      expect(result.address, isNull);
      expect(result.problem, InstanceAddressProblem.plainHttpNotAllowed);
    });

    test('Given an HTTP URL in a debug build '
        'When it is parsed '
        'Then it is accepted', () {
      final result = InstanceAddress.parse(
        'http://localhost:5000',
        allowPlainHttp: true,
      );

      expect(result.address?.uri.port, 5000);
    });

    for (final input in ['', '   ', 'vault.example', 'https://', 'not a url']) {
      test('Given "$input" '
          'When it is parsed '
          'Then it is refused as malformed', () {
        expect(
          InstanceAddress.parse(input, allowPlainHttp: true).problem,
          InstanceAddressProblem.malformed,
        );
      });
    }

    test('Given a scheme other than https or http '
        'When it is parsed '
        'Then it is refused', () {
      expect(
        InstanceAddress.parse(
          'ftp://vault.example',
          allowPlainHttp: true,
        ).problem,
        InstanceAddressProblem.unsupportedScheme,
      );
    });

    for (final input in [
      'https://vault.example/?a=1',
      'https://vault.example/#top',
      'https://user:secret@vault.example',
    ]) {
      test('Given "$input" '
          'When it is parsed '
          'Then a query, fragment or credentials are refused', () {
        expect(
          InstanceAddress.parse(input, allowPlainHttp: false).problem,
          InstanceAddressProblem.unexpectedParts,
        );
      });
    }
  });
}
