import 'package:flutter/material.dart';

import '../theme/theme_controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool modeSombre =
        themeController.themeMode ==
            ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Paramètres',
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),

        children: [
          Card(
            child: SwitchListTile(
              title: const Text(
                'Mode sombre',
              ),

              subtitle: Text(
                modeSombre
                    ? 'Le mode sombre est activé'
                    : 'Le mode clair est activé',
              ),

              secondary: Icon(
                modeSombre
                    ? Icons.dark_mode
                    : Icons.light_mode,
              ),

              value: modeSombre,

              onChanged: (value) {
                themeController.toggleTheme(
                  value,
                );
              },
            ),
          ),

          const SizedBox(height: 20),

          Card(
            child: const ListTile(
              leading: Icon(
                Icons.info_outline,
              ),

              title: Text(
                'À propos',
              ),

              subtitle: Text(
                'CinéApp — Projet Flutter débutant',
              ),
            ),
          ),

          const SizedBox(height: 10),

          const Card(
            child: ListTile(
              leading: Icon(
                Icons.code,
              ),

              title: Text(
                'Technologies',
              ),

              subtitle: Text(
                'Flutter • Dart • GoRouter',
              ),
            ),
          ),
        ],
      ),
    );
  }
}