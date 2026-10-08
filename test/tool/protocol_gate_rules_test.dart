import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

import '../../tool/protocol_gate_rules.dart';

void main() {
  group('approvedVersionIn', () {
    test('Given the real gate file '
        'When it is read '
        'Then the gate is closed', () {
      expect(
        approvedVersionIn(File(protocolGateFile).readAsStringSync()),
        isNull,
      );
    });

    test('Given a gate recording a version '
        'When it is read '
        'Then the version is returned', () {
      expect(
        approvedVersionIn("const String? approvedProtocolVersion = 'v1';"),
        'v1',
      );
      expect(
        approvedVersionIn('const String? approvedProtocolVersion = "v2";'),
        'v2',
      );
    });

    test('Given a gate file whose constant was renamed '
        'When it is read '
        'Then it fails rather than silently passing', () {
      expect(
        () => approvedVersionIn('const String? somethingElse = null;'),
        throwsFormatException,
      );
    });
  });

  group('protocolGateProblems — IR-06', () {
    test('Given a closed gate '
        'When it is checked '
        'Then there is nothing to require', () {
      expect(
        protocolGateProblems(
          approvedVersion: null,
          vectorFiles: const [],
          cryptoTestSources: const [],
        ),
        isEmpty,
      );
    });

    test('Given an open gate with no vectors and no test reading them '
        'When it is checked '
        'Then both are problems', () {
      expect(
        protocolGateProblems(
          approvedVersion: 'v1',
          vectorFiles: const ['test/vectors/cerberus/README.md'],
          cryptoTestSources: const ['void main() {}'],
        ),
        hasLength(2),
      );
    });

    test('Given an open gate with vectors and a test reading them '
        'When it is checked '
        'Then the build may proceed', () {
      expect(
        protocolGateProblems(
          approvedVersion: 'v1',
          vectorFiles: const ['test/vectors/cerberus/envelopes.json'],
          cryptoTestSources: const [
            "final v = File('test/vectors/cerberus/envelopes.json');",
          ],
        ),
        isEmpty,
      );
    });
  });
}
