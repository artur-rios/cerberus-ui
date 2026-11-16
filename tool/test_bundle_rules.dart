/// How the unit and widget suite is shared out into a few bundle files, as
/// data (see `write_test_bundles.dart`, which writes them).
///
/// `flutter test` compiles its entry points one after the other, whatever
/// `--concurrency` says, so with one entry point per test file most of a CI
/// run is spent compiling and loading test files in a row. A bundle imports a
/// share of the suite's files and runs each one's `main` in a group named
/// after its path: it is compiled once, runs its share in one process, and
/// the bundles run side by side.
///
/// What a bundle gives up is a process per test file: the files of a bundle
/// share an isolate. The one piece of state a file can inherit that it would
/// never see alone is flutter_test's widget binding, which the first
/// `testWidgets` creates and which then replaces `HttpClient` for the rest of
/// the isolate with one that answers every request with HTTP 400. So files
/// that use the binding are bundled apart from plain test files.
library;

/// Shares [sizes] (test file to size) out onto [count] bundles, keeping the
/// files in [widgetFiles] and the rest in bundles of their own.
///
/// Each kind present gets at least one bundle, so two kinds take at least two
/// bundles whatever [count] says; the rest go to the kind with the most size
/// per bundle. Within a kind, the largest file goes first onto the lightest
/// bundle; ties go to the lower bundle and the lower path. Empty bundles are
/// dropped, plain bundles come first, and each bundle's files are sorted by
/// path so the output only changes when the suite does.
List<List<String>> planTestBundles(
  Map<String, int> sizes,
  int count, {
  Set<String> widgetFiles = const <String>{},
}) {
  if (count < 1) {
    throw ArgumentError.value(count, 'count', 'must be 1 or more');
  }
  final kinds = <List<String>>[
    for (final widget in <bool>[false, true])
      <String>[
        for (final file in sizes.keys)
          if (widgetFiles.contains(file) == widget) file,
      ],
  ]..removeWhere((files) => files.isEmpty);
  if (kinds.isEmpty) return <List<String>>[];
  int weight(List<String> files) =>
      files.fold<int>(0, (total, file) => total + sizes[file]!);

  final shares = List<int>.filled(kinds.length, 1);
  for (var spare = count - kinds.length; spare > 0; spare -= 1) {
    var heaviest = 0;
    for (var i = 1; i < kinds.length; i++) {
      if (weight(kinds[i]) * shares[heaviest] >
          weight(kinds[heaviest]) * shares[i]) {
        heaviest = i;
      }
    }
    shares[heaviest] += 1;
  }

  return <List<String>>[
    for (final (index, files) in kinds.indexed)
      ..._balance(files, sizes, shares[index]),
  ];
}

List<List<String>> _balance(
  List<String> files,
  Map<String, int> sizes,
  int count,
) {
  final ordered = [...files]
    ..sort((a, b) {
      final bySize = sizes[b]!.compareTo(sizes[a]!);
      return bySize != 0 ? bySize : a.compareTo(b);
    });
  final bundles = <List<String>>[for (var i = 0; i < count; i++) <String>[]];
  final weights = List<int>.filled(count, 0);
  for (final file in ordered) {
    var lightest = 0;
    for (var i = 1; i < count; i++) {
      if (weights[i] < weights[lightest]) lightest = i;
    }
    bundles[lightest].add(file);
    weights[lightest] += sizes[file]!;
  }
  return <List<String>>[
    for (final bundle in bundles)
      if (bundle.isNotEmpty) bundle..sort(),
  ];
}

/// Whether a test file's [source] uses flutter_test's widget binding, which
/// then stays for every file after it in the same isolate.
bool usesWidgetBinding(String source) => _widgetBinding.hasMatch(source);

final RegExp _widgetBinding = RegExp(
  r'\btestWidgets\s*\(|\bWidgetTester\b|WidgetsFlutterBinding\b',
);

/// The source of a bundle written to [from] (a posix directory below the
/// package root, such as `build/test-bundles`) that imports each of [files]
/// (posix paths relative to the package root) and runs each one's `main` in a
/// group named after its path under `test/`.
String testBundleSource(List<String> files, {required String from}) {
  final up = '../' * from.split('/').where((part) => part.isNotEmpty).length;
  final source = StringBuffer()
    ..writeln('// Written by tool/write_test_bundles.dart. Do not edit.')
    ..writeln("import 'package:flutter_test/flutter_test.dart';")
    ..writeln();
  for (final (index, file) in files.indexed) {
    source.writeln("import '$up$file' as t$index;");
  }
  source
    ..writeln()
    ..writeln('void main() {');
  for (final (index, file) in files.indexed) {
    final name = file.startsWith('test/') ? file.substring(5) : file;
    source.writeln("  group('$name', t$index.main);");
  }
  source.writeln('}');
  return source.toString();
}

/// [path] with forward slashes, as an import and a test name spell it.
String posixPath(String path) => path.replaceAll(r'\', '/');
