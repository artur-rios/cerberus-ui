/// Writes the unit and widget suite into a few bundle files, and prints the
/// path of each (`test_bundle_rules.dart` says why and how they are shared).
///
/// ```bash
/// dart run tool/write_test_bundles.dart [<directory>] [<bundles>]
/// flutter test --coverage --concurrency 4 build/test-bundles
/// ```
///
/// The defaults are `build/test-bundles` and 4. The directory is emptied and
/// rewritten on every run; it lives under `build/`, which is neither committed
/// nor analysed. CI runs the suite this way; `flutter test` with a path still
/// runs each file in its own process, which is the loop for one area.
library;

import 'dart:io';

import 'test_bundle_rules.dart';

void main(List<String> arguments) {
  final directory = posixPath(
    arguments.isNotEmpty ? arguments[0] : 'build/test-bundles',
  );
  final count = arguments.length > 1 ? int.tryParse(arguments[1]) : 4;
  if (count == null || count < 1) {
    stderr.writeln(
      'tool/write_test_bundles.dart: the bundle count must be 1 '
      'or more',
    );
    exit(2);
  }

  final tests = Directory('test')
      .listSync(recursive: true)
      .whereType<File>()
      .where((file) => file.path.endsWith('_test.dart'))
      .toList();
  if (tests.isEmpty) {
    stderr.writeln('tool/write_test_bundles.dart: no test files under test/');
    exit(1);
  }

  final bundles = planTestBundles(
    {for (final file in tests) posixPath(file.path): file.lengthSync()},
    count,
    widgetFiles: {
      for (final file in tests)
        if (usesWidgetBinding(file.readAsStringSync())) posixPath(file.path),
    },
  );

  final output = Directory(directory);
  if (output.existsSync()) output.deleteSync(recursive: true);
  output.createSync(recursive: true);
  for (final (index, files) in bundles.indexed) {
    final path = '$directory/bundle_${index}_test.dart';
    File(path).writeAsStringSync(testBundleSource(files, from: directory));
    stdout.writeln(path);
  }
}
