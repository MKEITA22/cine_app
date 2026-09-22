import 'package:flutter_test/flutter_test.dart';

import 'package:cine_app/data/film_data.dart';
import 'package:cine_app/models/film.dart';
import 'package:cine_app/repositories/film_repository.dart';
import 'package:cine_app/services/film_service.dart';

void main() {
  late FilmService service;

  setUp(() {
    service = FilmService(
      InMemoryFilmRepository(filmsInitiaux),
    );
  });

  test('le service contient les films initiaux', () {
    expect(service.films.length, 6);
  });

  test('un nouveau film peut être ajouté', () {
    const nouveauFilm = Film(
      id: '100',
      titre: 'Matrix',
      genre: 'Science-fiction',
      annee: 1999,
      description: 'Un film culte.',
    );

    service.ajouterFilm(nouveauFilm);

    expect(service.films.length, 7);
    expect(service.films.contains(nouveauFilm), true);
  });
}