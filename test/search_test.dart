import 'package:flutter_test/flutter_test.dart';

import 'package:cine_app/data/film_data.dart';
import 'package:cine_app/repositories/film_repository.dart';
import 'package:cine_app/services/film_service.dart';

void main() {
  late FilmService service;

  setUp(() {
    service = FilmService(
      InMemoryFilmRepository(filmsInitiaux),
    );
  });

  test('la recherche trouve un film par son titre', () {
    final resultats = service.rechercher(
      recherche: 'inception',
    );

    expect(resultats.length, 1);
    expect(resultats.first.titre, 'Inception');
  });

  test('le filtre par genre fonctionne', () {
    final resultats = service.rechercher(
      genre: 'Science-fiction',
    );

    expect(resultats.length, 3);
  });

  test('la recherche et le filtre peuvent être combinés', () {
    final resultats = service.rechercher(
      recherche: 'inter',
      genre: 'Science-fiction',
    );

    expect(resultats.length, 1);
    expect(resultats.first.titre, 'Interstellar');
  });
}