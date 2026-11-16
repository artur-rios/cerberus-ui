import 'package:flutter_test/flutter_test.dart';

import '../../tool/test_bundle_rules.dart';

void main() {
  group('planTestBundles', () {
    test('Given files of different sizes '
        'When they are planned onto two bundles '
        'Then the largest goes first onto the lightest bundle', () {
      final bundles = planTestBundles({
        'test/a_test.dart': 10,
        'test/b_test.dart': 60,
        'test/c_test.dart': 30,
        'test/d_test.dart': 30,
        'test/e_test.dart': 20,
      }, 2);

      expect(bundles, [
        ['test/b_test.dart', 'test/e_test.dart'],
        ['test/a_test.dart', 'test/c_test.dart', 'test/d_test.dart'],
      ]);
    });

    test('Given files of equal size '
        'When they are planned '
        'Then ties go to the lower path and the lower bundle', () {
      final bundles = planTestBundles({
        'test/z_test.dart': 5,
        'test/y_test.dart': 5,
        'test/x_test.dart': 5,
      }, 3);

      expect(bundles, [
        ['test/x_test.dart'],
        ['test/y_test.dart'],
        ['test/z_test.dart'],
      ]);
    });

    test('Given more bundles than files '
        'When they are planned '
        'Then empty bundles are dropped and every file is planned once', () {
      final bundles = planTestBundles({
        'test/a_test.dart': 1,
        'test/b_test.dart': 2,
      }, 4);

      expect(bundles, hasLength(2));
      expect(bundles.expand((bundle) => bundle), [
        'test/b_test.dart',
        'test/a_test.dart',
      ]);
    });

    test('Given no files '
        'When they are planned '
        'Then there is no bundle', () {
      expect(planTestBundles({}, 4), isEmpty);
    });

    test('Given a bundle count below one '
        'When files are planned '
        'Then the count is rejected', () {
      expect(
        () => planTestBundles({'test/a_test.dart': 1}, 0),
        throwsArgumentError,
      );
    });

    test('Given plain and widget files '
        'When they are planned '
        'Then no bundle mixes them and the plain bundles come first', () {
      final bundles = planTestBundles(
        {
          'test/plain_a_test.dart': 10,
          'test/plain_b_test.dart': 10,
          'test/widget_a_test.dart': 30,
          'test/widget_b_test.dart': 30,
          'test/widget_c_test.dart': 30,
        },
        4,
        widgetFiles: {
          'test/widget_a_test.dart',
          'test/widget_b_test.dart',
          'test/widget_c_test.dart',
        },
      );

      expect(bundles, [
        ['test/plain_a_test.dart', 'test/plain_b_test.dart'],
        ['test/widget_a_test.dart'],
        ['test/widget_b_test.dart'],
        ['test/widget_c_test.dart'],
      ]);
    });

    test('Given plain and widget files and a single bundle asked for '
        'When they are planned '
        'Then each kind still gets a bundle of its own', () {
      final bundles = planTestBundles(
        {'test/plain_test.dart': 1, 'test/widget_test.dart': 1},
        1,
        widgetFiles: {'test/widget_test.dart'},
      );

      expect(bundles, [
        ['test/plain_test.dart'],
        ['test/widget_test.dart'],
      ]);
    });

    test('Given only widget files '
        'When they are planned '
        'Then every bundle goes to them', () {
      final bundles = planTestBundles(
        {'test/a_test.dart': 1, 'test/b_test.dart': 1},
        2,
        widgetFiles: {'test/a_test.dart', 'test/b_test.dart'},
      );

      expect(bundles, [
        ['test/a_test.dart'],
        ['test/b_test.dart'],
      ]);
    });
  });

  group('usesWidgetBinding', () {
    for (final source in [
      "testWidgets('x', (tester) async {});",
      'Future<void> pump(WidgetTester tester) async {}',
      'TestWidgetsFlutterBinding.ensureInitialized();',
      'IntegrationTestWidgetsFlutterBinding.ensureInitialized();',
    ]) {
      test('Given a test file containing "$source" '
          'When it is classified '
          'Then it uses the widget binding', () {
        expect(usesWidgetBinding(source), isTrue);
      });
    }

    test('Given a test file of plain tests '
        'When it is classified '
        'Then it does not use the widget binding', () {
      expect(usesWidgetBinding("test('x', () {});"), isFalse);
    });
  });

  group('testBundleSource', () {
    test('Given the files of a bundle '
        'When its source is written '
        'Then each file is imported relative to the bundle '
        'and runs in a group named after its path under test/', () {
      final source = testBundleSource([
        'test/app/a_test.dart',
        'test/features/b_test.dart',
      ], from: 'build/test-bundles');

      expect(
        source,
        '// Written by tool/write_test_bundles.dart. Do not edit.\n'
        "import 'package:flutter_test/flutter_test.dart';\n"
        '\n'
        "import '../../test/app/a_test.dart' as t0;\n"
        "import '../../test/features/b_test.dart' as t1;\n"
        '\n'
        'void main() {\n'
        "  group('app/a_test.dart', t0.main);\n"
        "  group('features/b_test.dart', t1.main);\n"
        '}\n',
      );
    });

    test('Given a bundle directory with a trailing slash '
        'When its source is written '
        'Then the imports climb exactly as many directories', () {
      expect(
        testBundleSource(['test/a_test.dart'], from: 'out/'),
        contains("import '../test/a_test.dart' as t0;"),
      );
    });
  });

  group('posixPath', () {
    test('Given a Windows path '
        'When it is normalized '
        'Then it uses forward slashes', () {
      expect(posixPath(r'test\app\a_test.dart'), 'test/app/a_test.dart');
    });

    test('Given a posix path '
        'When it is normalized '
        'Then it is unchanged', () {
      expect(posixPath('test/app/a_test.dart'), 'test/app/a_test.dart');
    });
  });
}
