import '../models/film.dart';

abstract class FilmRepository {
  List<Film> getAll();

  void add(Film film);
}

class InMemoryFilmRepository implements FilmRepository {
  final List<Film> _films;

  InMemoryFilmRepository(List<Film> films)
      : _films = List<Film>.from(films);

  @override
  List<Film> getAll() {
    return List<Film>.unmodifiable(_films);
  }

  @override
  void add(Film film) {
    _films.add(film);
  }
}