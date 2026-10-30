/// Fails the build when a boundary rule is broken (IR-12; see
/// `boundary_rules.dart` for every rule and why).
///
/// Run by CI on every pull request and push:
///
/// ```bash
/// dart run tool/check_boundaries.dart
/// ```
///
/// Exits 0 when clean, 1 with an explanation per violation otherwise.
library;

import 'dart:io';

import 'boundary_rules.dart';

Future<void> main(List<String> arguments) async {
  final root = Directory(arguments.isEmpty ? 'lib' : arguments.first);
  if (!root.existsSync()) {
    stderr.writeln('No such directory: ${root.path}');
    exit(2);
  }

  final files = <SourceFile>[];
  await for (final entity in root.list(recursive: true, followLinks: false)) {
    if (entity is! File || !entity.path.endsWith('.dart')) continue;

    // Generated code is exempt: it is regenerated and drift-checked in CI
    // (IR-11), a stronger guarantee than this checker could give.
    if (entity.path.endsWith('.g.dart') ||
        entity.path.contains(
          '${Platform.pathSeparator}l10n${Platform.pathSeparator}app_localizations',
        )) {
      continue;
    }

    files.add(SourceFile(entity.path, await entity.readAsString()));
  }

  final violations = [
    ...checkBoundaries(files),
    ...checkResolvedPackages(await File('pubspec.lock').readAsString()),
  ];

  if (violations.isEmpty) {
    stdout.writeln(
      'Boundaries clean: ${files.length} files and pubspec.lock checked.',
    );
    return;
  }

  stderr.writeln('${violations.length} boundary violation(s):\n');
  for (final violation in violations) {
    stderr.writeln('$violation\n');
  }
  exit(1);
}
