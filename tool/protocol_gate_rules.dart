/// The protocol gate's CI rule, as data (IR-06).
///
/// A build whose gate records an approved protocol version must carry the
/// Cerberus interoperability vectors, and a test that runs them. CI runs the
/// full suite before this check, so a present-but-failing vector has already
/// failed the build; this rule catches the vectors being absent, or never run.
library;

/// Where the gate is recorded.
const protocolGateFile = 'lib/core/crypto/protocol_gate.dart';

/// Where the Cerberus interoperability vectors live, as data files.
const cerberusVectorsDirectory = 'test/vectors/cerberus/';

/// Where the tests that run them live.
const cryptoTestsDirectory = 'test/core/crypto/';

/// The approved protocol version [gateSource] records, `null` while the gate
/// is closed. Throws [FormatException] when the constant cannot be found, so
/// that renaming it cannot silently disable this check.
String? approvedVersionIn(String gateSource) {
  final match = RegExp(
    r'''const\s+String\?\s+approvedProtocolVersion\s*=\s*(null|'([^']*)'|"([^"]*)")\s*;''',
  ).firstMatch(gateSource);

  if (match == null) {
    throw const FormatException(
      'approvedProtocolVersion was not found in $protocolGateFile.',
    );
  }

  return match.group(1) == 'null' ? null : (match.group(2) ?? match.group(3));
}

/// The problems with a gate recording [approvedVersion], given the vector
/// files present and the contents of the crypto tests. Empty means the build
/// may proceed.
List<String> protocolGateProblems({
  required String? approvedVersion,
  required Iterable<String> vectorFiles,
  required Iterable<String> cryptoTestSources,
}) {
  if (approvedVersion == null) return const [];

  final problems = <String>[];

  final vectors = vectorFiles.where((file) => file.endsWith('.json')).toList();
  if (vectors.isEmpty) {
    problems.add(
      'The protocol gate records version $approvedVersion, but there are no '
      'Cerberus interoperability vectors in $cerberusVectorsDirectory.',
    );
  }

  if (!cryptoTestSources.any(
    (source) => source.contains(cerberusVectorsDirectory),
  )) {
    problems.add(
      'The protocol gate records version $approvedVersion, but no test under '
      '$cryptoTestsDirectory reads $cerberusVectorsDirectory.',
    );
  }

  return problems;
}
