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
        title: Text(
          film.titre,
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [
            Stack(
              children: [
                Container(
                  height: 240,
                  width: double.infinity,

                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(16),

                    color: Theme.of(context)
                        .colorScheme
                        .primaryContainer,
                  ),

                  child: const Icon(
                    Icons.movie,
                    size: 110,
                  ),
                ),

                Positioned(
                  left: 15,
                  bottom: 15,

                  child: Chip(
                    avatar: const Icon(
                      Icons.category,
                    ),

                    label: Text(
                      film.genre,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            Text(
              film.titre,

              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                const Icon(
                  Icons.calendar_today,
                  size: 20,
                ),

                const SizedBox(width: 8),

                Text(
                  'Année : ${film.annee}',
                ),
              ],
            ),

            const SizedBox(height: 25),

            const Text(
              'Description',

              style: TextStyle(
                fontSize: 20,
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