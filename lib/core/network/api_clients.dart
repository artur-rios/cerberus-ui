/// The generated API clients, wired to the configured `dio` (IR-09, IR-10).
///
/// Repositories depend on these providers; nothing above a repository touches
/// `dio` or a generated client (`FR-DA-01`).
library;

import 'package:cerberus_api_client/export.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'http_client.dart';

/// `/api/accounts`.
final accountClientProvider = Provider<AccountClient>(
  (ref) => AccountClient(ref.watch(httpClientProvider)),
);

/// `/api/auth`.
final authClientProvider = Provider<AuthClient>(
  (ref) => AuthClient(ref.watch(httpClientProvider)),
);
