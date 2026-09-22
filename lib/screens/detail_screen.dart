import 'package:flutter/material.dart';

import '../models/film.dart';

class DetailScreen extends StatelessWidget {
  final Film film;

  const DetailScreen({
    super.key,
    required this.film,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Détail du film'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: 220,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Theme.of(context)
                        .colorScheme
                        .primaryContainer,
                  ),
                ),
                const Icon(
                  Icons.movie,
                  size: 90,
                ),
              ],
            ),
            const SizedBox(height: 24),
            Chip(
              avatar: const Icon(Icons.category),
              label: Text(film.genre),
            ),
            const SizedBox(height: 12),
            Text(
              film.titre,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'Année de sortie : ${film.annee}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Divider(height: 32),
            Text(
              'Description',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),
            Text(
              film.description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}