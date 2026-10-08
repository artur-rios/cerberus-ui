/// Fails the build when the protocol gate is open without the Cerberus
/// interoperability vectors present and run (IR-06, FR-CR-10).
///
/// ```bash
/// dart run tool/check_protocol_gate.dart
/// ```
///
/// Run by CI after the test suite, so the vectors it finds have also passed.
library;

import 'dart:io';

import 'protocol_gate_rules.dart';

Future<void> main() async {
  final approvedVersion = approvedVersionIn(
    await File(protocolGateFile).readAsString(),
  );

  final problems = protocolGateProblems(
    approvedVersion: approvedVersion,
    vectorFiles: _files(cerberusVectorsDirectory).map((file) => file.path),
    cryptoTestSources: _files(cryptoTestsDirectory)
        .where((file) => file.path.endsWith('_test.dart'))
        .map((file) => file.readAsStringSync()),
  );

  if (problems.isNotEmpty) {
    problems.forEach(stderr.writeln);
    exit(1);
  }

  stdout.writeln(
    approvedVersion == null
        ? 'Protocol gate closed: protocol-dependent flows are unavailable.'
        : 'Protocol gate open at $approvedVersion, with its vectors present.',
  );
}

Iterable<File> _files(String path) {
  final directory = Directory(path);
  if (!directory.existsSync()) return const [];
  return directory.listSync(recursive: true).whereType<File>();
}
