import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../data/films.dart';
import '../models/film.dart';
import '../widgets/film_card.dart';
import '../widgets/genre_chip.dart';
import '../widgets/search_bar_widget.dart';

class FilmsScreen extends StatefulWidget {
  const FilmsScreen({super.key});

  @override
  State<FilmsScreen> createState() => _FilmsScreenState();
}

class _FilmsScreenState extends State<FilmsScreen> {
  String recherche = '';

  String genreSelectionne = 'Tous';

  List<String> get genres {
    return [
      'Tous',
      ...films.map(
        (film) => film.genre,
      ).toSet(),
    ];
  }

  List<Film> get filmsFiltres {
    return films.where((film) {
      final titreCorrespond = film.titre
          .toLowerCase()
          .contains(
            recherche.toLowerCase(),
          );

      final genreCorrespond =
          genreSelectionne == 'Tous' ||
              film.genre == genreSelectionne;

      return titreCorrespond && genreCorrespond;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Nos films',
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go('/add');
        },

        child: const Icon(
          Icons.add,
        ),
      ),

      body: Column(
        children: [
          SearchBarWidget(
            onChanged: (value) {
              setState(() {
                recherche = value;
              });
            },
          ),

          SizedBox(
            height: 55,

            child: ListView(
              scrollDirection: Axis.horizontal,

              padding: const EdgeInsets.symmetric(
                horizontal: 8,
              ),

              children: genres.map((genre) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                  ),

                  child: GenreChip(
                    genre: genre,

                    selected:
                        genre == genreSelectionne,

                    onSelected: () {
                      setState(() {
                        genreSelectionne = genre;
                      });
                    },
                  ),
                );
              }).toList(),
            ),
          ),

          const SizedBox(height: 5),

          Expanded(
            child: filmsFiltres.isEmpty
                ? const Center(
                    child: Column(
                      mainAxisAlignment:
                          MainAxisAlignment.center,

                      children: [
                        Icon(
                          Icons.search_off,
                          size: 60,
                        ),

                        SizedBox(height: 10),

                        Text(
                          'Aucun film trouvé.',
                        ),
                      ],
                    ),
                  )
                : LayoutBuilder(
                    builder: (
                      context,
                      constraints,
                    ) {
                      if (constraints.maxWidth >= 700) {
                        return GridView.builder(
                          padding:
                              const EdgeInsets.all(8),

                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,

                            childAspectRatio: 3,
                          ),

                          itemCount:
                              filmsFiltres.length,

                          itemBuilder:
                              (context, index) {
                            final film =
                                filmsFiltres[index];

                            return FilmCard(
                              film: film,

                              onTap: () {
                                context.go(
                                  '/detail',
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

                        itemCount:
                            filmsFiltres.length,

                        itemBuilder:
                            (context, index) {
                          final film =
                              filmsFiltres[index];

                          return FilmCard(
                            film: film,

                            onTap: () {
                              context.go(
                                '/detail',
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
    );
  }
}