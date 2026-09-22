import 'package:flutter_test/flutter_test.dart';

import 'package:cine_app/models/film.dart';

void main() {
  test('un film est correctement créé', () {
    const film = Film(
      id: '1',
      titre: 'Inception',
      genre: 'Science-fiction',
      annee: 2010,
      description: 'Un film.',
    );

    expect(film.titre, 'Inception');
    expect(film.genre, 'Science-fiction');
    expect(film.annee, 2010);
  });

  test('copyWith modifie correctement un film', () {
    const film = Film(
      id: '1',
      titre: 'Inception',
      genre: 'Science-fiction',
      annee: 2010,
      description: 'Un film.',
    );

    final copie = film.copyWith(
      titre: 'Interstellar',
    );

    expect(copie.titre, 'Interstellar');
    expect(copie.id, '1');
    expect(copie.annee, 2010);
  });
}