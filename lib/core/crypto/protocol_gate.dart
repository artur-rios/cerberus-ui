/// The protocol gate (IR-05, FR-CR-02, Operations & Infrastructure §2.5).
///
/// `core/crypto` is the only module that may import a cryptographic package
/// (IR-12) and implements only the reviewed Cerberus protocol (FR-CR-01). Until
/// that protocol passes its security and client-interoperability review, there
/// is nothing to implement, and every flow that encrypts, decrypts, wraps,
/// proves or recovers is unavailable — its entry points absent and its routes
/// refusing — rather than offered and failing, or improvised.
///
/// The gate is one constant. It changes only in the pull request that adopts an
/// approved protocol: the one that adds the reviewed Cerberus vectors to
/// `test/vectors/` and pins the cryptographic libraries in the Technology Stack
/// Document. CI fails a build whose gate is open without those vectors present
/// and passing (IR-06, `tool/check_protocol_gate.dart`).
library;

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The approved Cerberus protocol version, or `null` while none is approved.
///
/// **Closed.** The protocol is proposed, not approved: see the Cerberus API's
/// `docs/security/protocol-review.md`.
const String? approvedProtocolVersion = null;

/// Whether protocol-dependent flows are available.
@immutable
class ProtocolGate {
  const ProtocolGate({required this.approvedVersion});

  /// The approved protocol version, or `null` while the gate is closed.
  final String? approvedVersion;

  /// Whether a protocol version has been approved.
  bool get isOpen => approvedVersion != null;
}

/// The gate as this build records it. Overridden in tests only, to exercise
/// what an open gate would admit — never in production code.
final protocolGateProvider = Provider<ProtocolGate>(
  (ref) => const ProtocolGate(approvedVersion: approvedProtocolVersion),
);
