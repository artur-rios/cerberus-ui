/// A screen that states one thing: a refusal, an absence, a missing feature.
library;

import 'package:flutter/material.dart';

/// A centered icon, title and body, readable at every width (NFR-12).
class MessageScreen extends StatelessWidget {
  const MessageScreen({
    required this.icon,
    required this.title,
    required this.body,
    this.actions = const [],
    super.key,
  });

  final IconData icon;
  final String title;
  final String body;

  /// What the user can do from here, in the app bar — signing out, for a
  /// signed-in user the guard sent here.
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(title), actions: actions),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 480),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: 48, color: theme.colorScheme.primary),
                const SizedBox(height: 16),
                Text(
                  body,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
