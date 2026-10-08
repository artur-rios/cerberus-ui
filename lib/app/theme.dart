/// Material 3, light and dark, from one seed color (Technology Stack §2).
library;

import 'package:flutter/material.dart';

/// The seed both schemes derive from.
const seedColor = Color(0xFF5B3E96);

/// The light theme.
final ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: seedColor),
);

/// The dark theme.
final ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: seedColor,
    brightness: Brightness.dark,
  ),
);
