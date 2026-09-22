import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../services/film_service.dart';
import '../widgets/empty_state_widget.dart';
import '../widgets/film_card.dart';
import '../widgets/genre_chip.dart';
import '../widgets/search_bar_widget.dart';

class FilmsScreen extends StatefulWidget {
  const FilmsScreen({super.key});

  @override
  State<FilmsScreen> createState() => _FilmsScreenState();
}

class _FilmsScreenState extends State<FilmsScreen> {
  String _recherche = '';
  String? _genreSelectionne;

  @override
  Widget build(BuildContext context) {
    final filmService = context.watch<FilmService>();

    final films = filmService.rechercher(
      recherche: _recherche,
      genre: _genreSelectionne,
    );

    final genres = filmService.genres;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Films'),
        actions: [
          IconButton(
            onPressed: () {
              context.goNamed('settings');
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.goNamed('add');
        },
        icon: const Icon(Icons.add),
        label: const Text('Ajouter'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SearchBarWidget(
              onChanged: (value) {
                setState(() {
                  _recherche = value;
                });
              },
            ),

            const SizedBox(height: 12),

            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  GenreChip(
                    genre: 'Tous',
                    selected: _genreSelectionne == null,
                    onSelected: () {
                      setState(() {
                        _genreSelectionne = null;
                      });
                    },
                  ),

                  ...genres.map(
                    (genre) => GenreChip(
                      genre: genre,
                      selected:
                          _genreSelectionne == genre,
                      onSelected: () {
                        setState(() {
                          _genreSelectionne = genre;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            Expanded(
              child: films.isEmpty
                  ? const EmptyStateWidget(
                      message:
                          'Aucun film ne correspond à votre recherche.',
                    )
                  : LayoutBuilder(
                      builder: (context, constraints) {
                        if (constraints.maxWidth >= 700) {
                          return GridView.builder(
                            padding:
                                const EdgeInsets.only(
                              bottom: 80,
                            ),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 2.2,
                            ),
                            itemCount: films.length,
                            itemBuilder: (context, index) {
                              final film = films[index];

                              return FilmCard(
                                film: film,
                                onTap: () {
                                  context.goNamed(
                                    'detail',
                                    extra: film,
                                  );
                                },
                              );
                            },
                          );
                        }

                        return ListView.builder(
                          padding:
                              const EdgeInsets.only(
                            bottom: 80,
                          ),
                          itemCount: films.length,
                          itemBuilder: (context, index) {
                            final film = films[index];

                            return FilmCard(
                              film: film,
                              onTap: () {
                                context.goNamed(
                                  'detail',
                                  extra: film,
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}