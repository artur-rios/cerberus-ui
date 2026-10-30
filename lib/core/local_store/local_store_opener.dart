/// Opens the local store for the target being compiled (IR-08, §2.6).
///
/// Selected by conditional import: Windows, Linux and Android get a SQLite file
/// in the application support directory; the web gets an implementation that
/// never constructs the store, so the web build does not contain it.
library;

export 'local_store_opener_web.dart'
    if (dart.library.ffi) 'local_store_opener_native.dart';
