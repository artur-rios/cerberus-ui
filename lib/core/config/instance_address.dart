/// The address of a Cerberus API instance, checked before it is used.
///
/// Every request goes to exactly one destination (`FR-PV-04`), so the address
/// is a value with a parser rather than a string passed around and trusted.
/// The parser is the one place that decides what a usable address looks like
/// (`FR-CF-02`, `NFR-03`).
library;

import 'package:flutter/foundation.dart';

/// Why an address was refused. The setup screen turns these into messages.
enum InstanceAddressProblem {
  /// Empty, or not an absolute URL with a host.
  malformed,

  /// `http://` in a build that does not allow plain HTTP.
  plainHttpNotAllowed,

  /// A scheme other than `https` or `http`.
  unsupportedScheme,

  /// The URL carries a query, a fragment or credentials, none of which belong
  /// in a base address — and credentials in a URL would be a leak.
  unexpectedParts,
}

/// A well-formed base address of a Cerberus API instance.
@immutable
final class InstanceAddress {
  const InstanceAddress._(this.uri);

  /// The address, normalized: no trailing slash on the path.
  final Uri uri;

  /// Parses [input], or explains why it cannot be used.
  ///
  /// [allowPlainHttp] is true in debug builds only; see `AppConfig`.
  static ({InstanceAddress? address, InstanceAddressProblem? problem}) parse(
    String input, {
    required bool allowPlainHttp,
  }) {
    final trimmed = input.trim();
    final uri = Uri.tryParse(trimmed);

    if (trimmed.isEmpty || uri == null || !uri.hasScheme || uri.host.isEmpty) {
      return (address: null, problem: InstanceAddressProblem.malformed);
    }

    switch (uri.scheme) {
      case 'https':
        break;
      case 'http':
        if (!allowPlainHttp) {
          return (
            address: null,
            problem: InstanceAddressProblem.plainHttpNotAllowed,
          );
        }
      default:
        return (
          address: null,
          problem: InstanceAddressProblem.unsupportedScheme,
        );
    }

    if (uri.hasQuery || uri.hasFragment || uri.userInfo.isNotEmpty) {
      return (address: null, problem: InstanceAddressProblem.unexpectedParts);
    }

    final path = uri.path.endsWith('/')
        ? uri.path.substring(0, uri.path.length - 1)
        : uri.path;

    return (address: InstanceAddress._(uri.replace(path: path)), problem: null);
  }

  @override
  bool operator ==(Object other) =>
      other is InstanceAddress && other.uri == uri;

  @override
  int get hashCode => uri.hashCode;

  @override
  String toString() => uri.toString();
}
