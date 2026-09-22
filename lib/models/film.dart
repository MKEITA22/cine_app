class Film {
  final String id;
  final String titre;
  final String genre;
  final int annee;
  final String description;

  const Film({
    required this.id,
    required this.titre,
    required this.genre,
    required this.annee,
    required this.description,
  });

  Film copyWith({
    String? id,
    String? titre,
    String? genre,
    int? annee,
    String? description,
  }) {
    return Film(
      id: id ?? this.id,
      titre: titre ?? this.titre,
      genre: genre ?? this.genre,
      annee: annee ?? this.annee,
      description: description ?? this.description,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is Film &&
        other.id == id &&
        other.titre == titre &&
        other.genre == genre &&
        other.annee == annee &&
        other.description == description;
  }

  @override
  int get hashCode {
    return Object.hash(
      id,
      titre,
      genre,
      annee,
      description,
    );
  }
}