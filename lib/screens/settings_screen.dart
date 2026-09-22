import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/theme_controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController =
        context.watch<ThemeController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Paramètres'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: SwitchListTile(
              title: const Text('Mode sombre'),
              subtitle: const Text(
                'Activer ou désactiver le thème sombre',
              ),
              secondary: const Icon(Icons.dark_mode),
              value: themeController.isDark,
              onChanged: (value) {
                context
                    .read<ThemeController>()
                    .setDarkMode(value);
              },
            ),
          ),

          const SizedBox(height: 16),

          Card(
            child: ListTile(
              leading: const Icon(Icons.info),
              title: const Text('À propos'),
              subtitle: const Text(
                'CineApp - Application de découverte de films ivoiriens',
              ),
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.code),
              title: const Text('Technologies'),
              subtitle: const Text(
                'Flutter, Dart, GoRouter et Provider',
              ),
            ),
          ),
        ],
      ),
    );
  }
}