/// Which Cerberus API instance this installation talks to (FR-CF-01, FR-CF-09).
///
/// Exactly one destination at a time (`FR-PV-04`). Resolved at start from the
/// address the user adopted — kept in preferences on desktop and Android, in
/// memory on the web — or else from the build's default. Adopting a new
/// address, and checking an instance's readiness first, are UC-01's.
library;

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../storage/preferences_store.dart';
import 'app_config.dart';
import 'instance_address.dart';

/// The adopted instance, or `null` when none is configured and the
/// application must start at setup.
class InstanceConfigController extends Notifier<InstanceAddress?> {
  @override
  InstanceAddress? build() => _parse(ref.read(appConfigProvider).apiBaseUrl);

  /// Restores an address adopted on an earlier run. One the user chose wins
  /// over the build's default; one that no longer parses is ignored rather
  /// than trusted.
  Future<void> restore() async {
    final stored = await ref
        .read(preferencesStoreProvider)
        .read(PreferenceKey.instanceAddress);
    final address = stored == null ? null : _parse(stored);
    if (address != null) state = address;
  }

  InstanceAddress? _parse(String input) {
    if (input.isEmpty) return null;
    return InstanceAddress.parse(
      input,
      allowPlainHttp: ref.read(appConfigProvider).allowPlainHttp,
    ).address;
  }
}

/// The adopted instance address.
final instanceConfigProvider =
    NotifierProvider<InstanceConfigController, InstanceAddress?>(
      InstanceConfigController.new,
    );
