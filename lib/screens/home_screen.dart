import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CinéApp',
        ),
      ),

      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              const Icon(
                Icons.movie,
                size: 90,
              ),

              const SizedBox(height: 20),

              Text(
                'Bienvenue sur CinéApp',
                textAlign: TextAlign.center,

                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),

              const SizedBox(height: 12),

              Text(
                'Découvrez notre sélection de films.',
                textAlign: TextAlign.center,

                style: Theme.of(context)
                    .textTheme
                    .bodyLarge,
              ),

              const SizedBox(height: 35),

              SizedBox(
                width: double.infinity,

                child: ElevatedButton.icon(
                  onPressed: () {
                    context.go('/films');
                  },

                  icon: const Icon(
                    Icons.movie,
                  ),

                  label: const Text(
                    'Voir les films',
                  ),
                ),
              ),

              const SizedBox(height: 12),

              SizedBox(
                width: double.infinity,

                child: OutlinedButton.icon(
                  onPressed: () {
                    context.go('/add');
                  },

                  icon: const Icon(
                    Icons.add,
                  ),

                  label: const Text(
                    'Ajouter un film',
                  ),
                ),
              ),

              const SizedBox(height: 12),

              TextButton.icon(
                onPressed: () {
                  context.go('/settings');
                },

                icon: const Icon(
                  Icons.settings,
                ),

                label: const Text(
                  'Paramètres',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}