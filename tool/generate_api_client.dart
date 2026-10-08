/// Generates the API client from `api/cerberus.json` (IR-10).
///
/// One command, three steps, in this order:
///
///   1. `swagger_parser` reads the OpenAPI document and emits the DTOs and the
///      retrofit clients.
///   2. `build_runner` runs inside the generated package to emit the
///      `.g.dart` bodies.
///   3. `dart format` runs over the package — because the generators' own line
///      breaking differs from what a repository-root format produces, and a
///      difference there would fail CI's drift check for no real reason.
///
/// The pipeline is deterministic: running it twice over an unchanged document
/// produces byte-identical output, which is what makes the drift check in
/// `.github/workflows/check-generated.yml` meaningful (IR-11).
library;

import 'dart:io';

const _packageDirectory = 'packages/cerberus_api_client';

Future<void> main() async {
  await _run('dart', ['run', 'swagger_parser']);
  await _run('dart', ['pub', 'get'], workingDirectory: _packageDirectory);
  await _run('dart', [
    'run',
    'build_runner',
    'build',
    '--delete-conflicting-outputs',
  ], workingDirectory: _packageDirectory);
  await _run('dart', ['format', _packageDirectory]);

  stdout.writeln('\nAPI client generated from api/cerberus.json.');
  stdout.writeln('Do not hand-edit $_packageDirectory/lib — regenerate.');
}

Future<void> _run(
  String executable,
  List<String> arguments, {
  String? workingDirectory,
}) async {
  final where = workingDirectory == null ? '' : ' (in $workingDirectory)';
  stdout.writeln('\$ $executable ${arguments.join(' ')}$where');

  final process = await Process.start(
    executable,
    arguments,
    workingDirectory: workingDirectory,
    runInShell: true,
    mode: ProcessStartMode.inheritStdio,
  );

  final code = await process.exitCode;
  if (code != 0) {
    stderr.writeln('\n$executable ${arguments.join(' ')} failed with $code.');
    exit(code);
  }
}
