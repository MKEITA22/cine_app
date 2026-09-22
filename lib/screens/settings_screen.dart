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
                'Modifier l apparence de l application',
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

          const Card(
            child: ListTile(
              leading: Icon(Icons.info),
              title: Text('À propos'),
              subtitle: Text(
                'CineApp — Projet Flutter multi-écrans',
              ),
            ),
          ),

          const Card(
            child: ListTile(
              leading: Icon(Icons.code),
              title: Text('Technologies'),
              subtitle: Text(
                'Flutter, Dart, GoRouter et Provider',
              ),
            ),
          ),
        ],
      ),
    );
  }
}