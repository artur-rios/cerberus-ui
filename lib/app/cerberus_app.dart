/// The application shell (Operations & Infrastructure §2.2).
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/config/preferences.dart';
import '../l10n/app_localizations.dart';
import 'router.dart';
import 'theme.dart';

/// The root widget: theme, localization and the guarded router. The theme
/// mode is the user's preference, so choosing one re-renders at once (UC-10
/// step 3).
class CerberusApp extends ConsumerWidget {
  const CerberusApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => MaterialApp.router(
    onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
    theme: lightTheme,
    darkTheme: darkTheme,
    themeMode: ref.watch(
      preferencesProvider.select((preferences) => preferences.themeMode),
    ),
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    routerConfig: ref.watch(routerProvider),
  );
}
