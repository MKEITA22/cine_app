import 'package:flutter/foundation.dart';

import '../models/film.dart';
import '../repositories/film_repository.dart';

class FilmService extends ChangeNotifier {
  final FilmRepository repository;

  FilmService(this.repository);

  List<Film> get films {
    return repository.getAll();
  }

  List<String> get genres {
    final result =
        films.map((film) => film.genre).toSet().toList();

    result.sort();

    return result;
  }

  List<Film> rechercher({
    String recherche = '',
    String? genre,
  }) {
    final texte = recherche.trim().toLowerCase();

    return films.where((film) {
      final correspondTitre =
          film.titre.toLowerCase().contains(texte);

      final correspondGenre =
          genre == null || film.genre == genre;

      return correspondTitre && correspondGenre;
    }).toList();
  }

  void ajouterFilm(Film film) {
    repository.add(film);
    notifyListeners();
  }
}