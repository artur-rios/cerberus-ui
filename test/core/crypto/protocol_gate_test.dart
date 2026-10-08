import 'package:cerberus_ui/core/crypto/protocol_gate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ProtocolGate', () {
    test('Given this build '
        'When the gate is read '
        'Then it is closed, because no protocol version is approved '
        '(FR-CR-02)', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      expect(approvedProtocolVersion, isNull);
      expect(container.read(protocolGateProvider).isOpen, isFalse);
    });

    test('Given an approved version '
        'When the gate is read '
        'Then it is open', () {
      expect(const ProtocolGate(approvedVersion: 'v1').isOpen, isTrue);
    });
  });
}
