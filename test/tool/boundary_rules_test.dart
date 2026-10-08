import 'package:flutter_test/flutter_test.dart';

import '../../tool/boundary_rules.dart';

List<String> _rules(String path, String contents) =>
    checkBoundaries([SourceFile(path, contents)]).map((v) => v.rule).toList();

void main() {
  group('checkBoundaries — IR-12', () {
    test('Given a cryptographic package outside core/crypto '
        'When the rules run '
        'Then it is a violation', () {
      expect(
        _rules(
          'lib/features/records/data/r.dart',
          "import 'package:webcrypto/webcrypto.dart';",
        ),
        ['IR-12'],
      );
    });

    test('Given a cryptographic package inside core/crypto '
        'When the rules run '
        'Then it is allowed', () {
      expect(
        _rules(
          'lib/core/crypto/aes.dart',
          "import 'package:webcrypto/webcrypto.dart';",
        ),
        isEmpty,
      );
    });

    test('Given a storage package outside core/storage and core/local_store '
        'When the rules run '
        'Then it is a violation', () {
      expect(
        _rules(
          'lib/features/session/state/s.dart',
          "import 'package:shared_preferences/shared_preferences.dart';",
        ),
        ['IR-12'],
      );
    });

    test('Given storage packages in core/storage and core/local_store '
        'When the rules run '
        'Then they are allowed', () {
      expect(
        _rules(
          'lib/core/storage/s.dart',
          "import 'package:flutter_secure_storage/flutter_secure_storage.dart';",
        ),
        isEmpty,
      );
      expect(
        _rules(
          'lib/core/local_store/l.dart',
          "import 'package:drift/drift.dart';",
        ),
        isEmpty,
      );
    });

    test('Given a commented-out import '
        'When the rules run '
        'Then it is ignored', () {
      expect(
        _rules(
          'lib/app/a.dart',
          "// import 'package:webcrypto/webcrypto.dart';",
        ),
        isEmpty,
      );
    });
  });

  group('checkBoundaries — FR-DA-01', () {
    test('Given dio in a provider '
        'When the rules run '
        'Then it is a violation', () {
      expect(
        _rules(
          'lib/features/records/state/p.dart',
          "import 'package:dio/dio.dart';",
        ),
        ['FR-DA-01'],
      );
    });

    test('Given dio in a repository or core/network '
        'When the rules run '
        'Then it is allowed', () {
      expect(
        _rules(
          'lib/features/records/data/r.dart',
          "import 'package:dio/dio.dart';",
        ),
        isEmpty,
      );
      expect(
        _rules('lib/core/network/n.dart', "import 'package:dio/dio.dart';"),
        isEmpty,
      );
    });

    test('Given the local store reached from a widget, relatively '
        'When the rules run '
        'Then it is a violation', () {
      expect(
        _rules(
          'lib/features/records/ui/w.dart',
          "import '../../../core/local_store/local_store.dart';",
        ),
        ['FR-DA-01'],
      );
    });
  });

  group('checkBoundaries — IR-02', () {
    test('Given a feature importing another feature, by package or relatively '
        'When the rules run '
        'Then each is a violation', () {
      expect(
        _rules(
          'lib/features/records/ui/w.dart',
          "import 'package:cerberus_ui/features/folders/ui/f.dart';\n"
              "import '../../folders/state/s.dart';",
        ),
        ['IR-02', 'IR-02'],
      );
    });

    test('Given a feature importing itself, core and shared '
        'When the rules run '
        'Then nothing is reported', () {
      expect(
        _rules(
          'lib/features/records/ui/w.dart',
          "import '../state/s.dart';\n"
              "import '../../../core/result/result.dart';\n"
              "import 'package:cerberus_ui/shared/widgets/m.dart';",
        ),
        isEmpty,
      );
    });
  });

  group('checkBoundaries — IR-15 and IR-18', () {
    test('Given dart:developer or debugPrint outside core/logging '
        'When the rules run '
        'Then each is a violation', () {
      expect(
        _rules(
          'lib/app/a.dart',
          "import 'dart:developer';\n  debugPrint('x');",
        ),
        ['IR-15', 'IR-15'],
      );
    });

    test('Given dart:developer in core/logging '
        'When the rules run '
        'Then it is allowed', () {
      expect(
        _rules('lib/core/logging/app_log.dart', "import 'dart:developer';"),
        isEmpty,
      );
    });

    test('Given browser storage or a service worker '
        'When the rules run '
        'Then each is a violation', () {
      expect(
        _rules(
          'lib/core/storage/w.dart',
          "import 'dart:html';\n"
              "window.localStorage['a'] = 'b';\n"
              'navigator.serviceWorker.register(x);',
        ),
        ['IR-18', 'IR-18', 'IR-18'],
      );
    });
  });

  group('checkResolvedPackages — IR-16', () {
    test('Given a crash reporter among the resolved packages '
        'When the lock file is checked '
        'Then it is a violation', () {
      final violations = checkResolvedPackages(
        'packages:\n  dio:\n    version: "5"\n  sentry_flutter:\n    version: "9"\n',
      );

      expect(violations.single.rule, 'IR-16');
      expect(violations.single.line, 4);
    });

    test('Given only allowed packages '
        'When the lock file is checked '
        'Then nothing is reported', () {
      expect(checkResolvedPackages('packages:\n  dio:\n'), isEmpty);
    });
  });

  group('BoundaryViolation', () {
    test('Given a violation '
        'When it is printed '
        'Then it names the place, the rule and the fix', () {
      const violation = BoundaryViolation(
        rule: 'IR-12',
        path: 'lib/a.dart',
        line: 3,
        source: 'import x;',
        explanation: 'Move it.',
      );

      expect(
        violation.toString(),
        'lib/a.dart:3  [IR-12]\n    import x;\n    Move it.',
      );
    });
  });
}
