/// The application shell (Operations & Infrastructure §2.2).
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../l10n/app_localizations.dart';
import 'router.dart';
import 'theme.dart';

/// The root widget: theme, localization and the guarded router.
class CerberusApp extends ConsumerWidget {
  const CerberusApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => MaterialApp.router(
    onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
    theme: lightTheme,
    darkTheme: darkTheme,
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    routerConfig: ref.watch(routerProvider),
  );
}
