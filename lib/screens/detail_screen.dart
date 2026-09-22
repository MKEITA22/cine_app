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
        title: const Text('Détails du film'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context)
                    .colorScheme
                    .primaryContainer,
              ),
              child: const Icon(
                Icons.movie,
                size: 90,
              ),
            ),

            const SizedBox(height: 24),

            Text(
              film.titre,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),

            const SizedBox(height: 12),

            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                Chip(
                  avatar: const Icon(
                    Icons.category,
                    size: 18,
                  ),
                  label: Text(film.genre),
                ),
                Chip(
                  avatar: const Icon(
                    Icons.calendar_today,
                    size: 18,
                  ),
                  label: Text('${film.annee}'),
                ),
              ],
            ),

            const SizedBox(height: 24),

            Text(
              'Description',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),

            const SizedBox(height: 10),

            Text(
              film.description,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}