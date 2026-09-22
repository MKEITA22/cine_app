import 'package:flutter_test/flutter_test.dart';

import 'package:cine_app/data/film_data.dart';
import 'package:cine_app/repositories/film_repository.dart';

void main() {
  group('InMemoryFilmRepository', () {
    test('retourne les films initiaux', () {
      final repository = InMemoryFilmRepository(filmsInitiaux);

      expect(repository.getAll(), isNotEmpty);
    });

    test('ajoute un film', () {
      final repository = InMemoryFilmRepository([]);

      repository.add(filmsInitiaux.first);

      expect(repository.getAll().length, 1);
      expect(repository.getAll().first.titre, 'Bal Poussière');
    });
  });
}