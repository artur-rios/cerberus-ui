/// The boundary rules, as data (IR-12, and the rules that keep IR-02, IR-15,
/// IR-16, IR-18 and FR-DA-01 true).
///
/// Separated from `check_boundaries.dart` so they can be tested against
/// fixtures rather than only against the real source tree — a checker nobody
/// has watched fail is a checker nobody knows works.
///
/// Enforced as a build step rather than an analyzer plugin: it runs in CI,
/// fails the build, and is easy to read. Worth revisiting if the rules grow.
library;

/// One violation, with enough detail to fix it without re-running anything.
class BoundaryViolation {
  const BoundaryViolation({
    required this.rule,
    required this.path,
    required this.line,
    required this.source,
    required this.explanation,
  });

  /// The requirement this breaks, e.g. `IR-12`.
  final String rule;
  final String path;

  /// One-based, as an editor counts.
  final int line;

  /// The offending line, trimmed.
  final String source;
  final String explanation;

  @override
  String toString() => '$path:$line  [$rule]\n    $source\n    $explanation';
}

/// A source file to check: its repository-relative path and its contents.
class SourceFile {
  const SourceFile(this.path, this.contents);

  final String path;
  final String contents;
}

/// The only directory that may import a cryptographic package (IR-05, IR-12).
const cryptoDirectory = 'lib/core/crypto/';

/// The only directories that may import a storage package (IR-12).
const storageDirectories = ['lib/core/storage/', 'lib/core/local_store/'];

/// The only directory that may write a log line (IR-15).
const loggingDirectory = 'lib/core/logging/';

/// Cryptographic packages. Any of them outside [cryptoDirectory] is a
/// violation, whether or not it is in the pubspec yet.
const cryptoPackages = {
  'argon2',
  'asn1lib',
  'basic_utils',
  'crypto',
  'cryptography',
  'cryptography_flutter',
  'dart_jsonwebtoken',
  'encrypt',
  'fast_rsa',
  'flutter_sodium',
  'hashlib',
  'jose',
  'pointycastle',
  'sodium',
  'sodium_libs',
  'steel_crypt',
  'webcrypto',
  'x509',
};

/// Storage packages. Any of them outside [storageDirectories] is a violation.
const storagePackages = {
  'drift',
  'flutter_secure_storage',
  'get_storage',
  'hive',
  'hive_flutter',
  'isar',
  'objectbox',
  'path_provider',
  'sembast',
  'shared_preferences',
  'sqflite',
  'sqlite3',
};

/// Packages that observe use: analytics, telemetry, crash reporting (IR-16).
/// Checked against every resolved package, direct or transitive.
const observingPackages = {
  'amplitude_flutter',
  'appcenter',
  'bugsnag_flutter',
  'datadog_flutter_plugin',
  'firebase_analytics',
  'firebase_crashlytics',
  'firebase_performance',
  'flutter_segment',
  'mixpanel_flutter',
  'newrelic_mobile',
  'posthog_flutter',
  'sentry',
  'sentry_flutter',
  'usage',
};

/// Browser storage and service-worker APIs. The web build uses none of them
/// (IR-18, FR-OF-16), anywhere in `lib/`.
const browserStorageApis = [
  'localStorage',
  'sessionStorage',
  'indexedDB',
  'serviceWorker',
  'document.cookie',
  'window.caches',
];

/// Applies every source rule to [files], returning each violation found.
List<BoundaryViolation> checkBoundaries(Iterable<SourceFile> files) {
  final violations = <BoundaryViolation>[];

  for (final file in files) {
    final path = file.path.replaceAll(r'\', '/');
    final lines = file.contents.split('\n');

    for (var i = 0; i < lines.length; i++) {
      final source = lines[i].trim();
      if (source.startsWith('//')) continue;

      void violation(String rule, String explanation) => violations.add(
        BoundaryViolation(
          rule: rule,
          path: path,
          line: i + 1,
          source: source,
          explanation: explanation,
        ),
      );

      final imported = _importedUri(source);
      if (imported != null) {
        final package = _packageOf(imported);
        final target = _resolve(path, imported);

        if (cryptoPackages.contains(package) &&
            !path.startsWith(cryptoDirectory)) {
          violation(
            'IR-12',
            "'$package' is cryptographic and belongs only under "
                "'$cryptoDirectory', which implements the reviewed protocol "
                'and nothing else (FR-CR-01, NFR-16).',
          );
        }

        if (storagePackages.contains(package) &&
            !storageDirectories.any(path.startsWith)) {
          violation(
            'IR-12',
            "'$package' is a storage package and belongs only under "
                "${storageDirectories.map((d) => "'$d'").join(' or ')} "
                '(NFR-16). Use the store interfaces they expose.',
          );
        }

        final reachesLocalStore =
            target?.startsWith('lib/core/local_store/') ?? false;
        if ((package == 'dio' || reachesLocalStore) &&
            !_mayReachTransport(path)) {
          violation(
            'FR-DA-01',
            'Only repositories (features/<feature>/data/) and core/network or '
                'core/local_store reach dio or the local store. Depend on a '
                'repository interface instead.',
          );
        }

        if (imported == 'dart:developer' &&
            !path.startsWith(loggingDirectory)) {
          violation(
            'IR-15',
            "Logging goes through '${loggingDirectory}app_log.dart', which "
                'redacts secrets and writes nothing in a release build.',
          );
        }

        if (imported == 'dart:html' || imported == 'dart:indexed_db') {
          violation(
            'IR-18',
            "'$imported' reaches browser storage. The web build uses none "
                '(FR-OF-16).',
          );
        }

        final crossFeature = target == null
            ? null
            : _crossFeatureImport(path, target);
        if (crossFeature != null) {
          violation(
            'IR-02',
            "A feature depends on core, not on another feature: '$crossFeature' "
                'is outside this one. Move what both need into core or shared.',
          );
        }
      }

      if (RegExp(r'(^|[^\w.])debugPrint\(').hasMatch(source) &&
          !path.startsWith(loggingDirectory)) {
        violation(
          'IR-15',
          "Use AppLog.event from '${loggingDirectory}app_log.dart'.",
        );
      }

      for (final api in browserStorageApis) {
        if (source.contains(api)) {
          violation(
            'IR-18',
            "'$api' is a browser storage or service-worker API. The web build "
                'uses none (FR-OF-16).',
          );
        }
      }
    }
  }

  return violations;
}

/// Checks the resolved package names in `pubspec.lock` (IR-16).
List<BoundaryViolation> checkResolvedPackages(String lockFile) {
  final violations = <BoundaryViolation>[];
  final lines = lockFile.split('\n');

  for (var i = 0; i < lines.length; i++) {
    // Package entries are the two-space-indented keys under `packages:`.
    final match = RegExp(r'^  ([a-z0-9_]+):\s*$').firstMatch(lines[i]);
    if (match == null) continue;
    final package = match.group(1)!;

    if (observingPackages.contains(package)) {
      violations.add(
        BoundaryViolation(
          rule: 'IR-16',
          path: 'pubspec.lock',
          line: i + 1,
          source: lines[i].trim(),
          explanation:
              "'$package' observes use. No analytics, telemetry or crash "
              'reporting is included, directly or transitively (FR-PV-01).',
        ),
      );
    }
  }

  return violations;
}

/// The URI an `import` or `export` directive names, or `null`.
String? _importedUri(String line) =>
    RegExp(r'''^(?:import|export)\s+['"]([^'"]+)['"]''')
        .firstMatch(line)
        ?.group(1);

/// The package a `package:` URI names, or `null` for any other URI.
String? _packageOf(String uri) =>
    uri.startsWith('package:') ? uri.substring(8).split('/').first : null;

/// Whether code at [path] may use dio or the local store directly.
bool _mayReachTransport(String path) =>
    path.startsWith('lib/core/network/') ||
    path.startsWith('lib/core/local_store/') ||
    RegExp(r'^lib/features/[^/]+/data/').hasMatch(path);

/// The repository path [uri] names when imported from [importer], or `null`
/// for a `dart:` URI or another package.
String? _resolve(String importer, String uri) {
  if (uri.startsWith('dart:')) return null;
  if (uri.startsWith('package:')) {
    const own = 'package:cerberus_ui/';
    return uri.startsWith(own) ? 'lib/${uri.substring(own.length)}' : null;
  }
  return Uri.parse(importer).resolve(uri).path;
}

/// The other feature [importer] reaches at [target], or `null`.
String? _crossFeatureImport(String importer, String target) {
  final pattern = RegExp(r'^lib/features/([^/]+)/');
  final own = pattern.firstMatch(importer)?.group(1);
  if (own == null) return null;

  final reached = pattern.firstMatch(target)?.group(1);
  if (reached == null || reached == own) return null;

  return 'features/$reached';
}
