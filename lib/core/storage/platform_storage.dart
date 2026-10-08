/// Picks the storage implementations for the target being compiled (§2.6).
///
/// Selected by conditional import, so the web build contains no code that could
/// write to browser storage: it never imports the platform packages' Dart APIs
/// at all (IR-07, IR-18).
library;

export 'platform_storage_native.dart'
    if (dart.library.js_interop) 'platform_storage_web.dart';
