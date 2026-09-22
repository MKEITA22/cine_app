import 'package:flutter/material.dart';

import '../theme/theme_controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paramètres'),
      ),
      body: AnimatedBuilder(
        animation: themeController,
        builder: (context, child) {
          return ListView(
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
                    themeController.setDarkMode(value);
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
                    'Flutter, Dart et GoRouter',
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}