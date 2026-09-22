import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/app_selection_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CineApp'),
        actions: [
          IconButton(
            onPressed: () {
              context.goNamed('settings');
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppSectionTitle(
              title: 'Bienvenue sur CineApp',
              subtitle:
                  'Découvrez notre sélection de films.',
            ),
            const SizedBox(height: 32),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    const Icon(
                      Icons.local_movies,
                      size: 80,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Votre espace cinéma',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Recherchez des films, consultez leurs détails '
                      'et ajoutez vos propres films.',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          context.goNamed('films');
                        },
                        icon: const Icon(Icons.movie),
                        label: const Text('Voir les films'),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () {
                          context.goNamed('add');
                        },
                        icon: const Icon(Icons.add),
                        label: const Text('Ajouter un film'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}