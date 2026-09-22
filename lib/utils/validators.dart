String? validateTitre(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Veuillez saisir un titre.';
  }

  if (value.trim().length < 2) {
    return 'Le titre doit contenir au moins 2 caractères.';
  }

  return null;
}

String? validateGenre(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Veuillez saisir un genre.';
  }

  return null;
}

String? validateAnnee(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Veuillez saisir une année.';
  }

  final annee = int.tryParse(value.trim());

  if (annee == null) {
    return 'Veuillez saisir une année valide.';
  }

  if (annee < 1900 || annee > 2100) {
    return 'L année doit être comprise entre 1900 et 2100.';
  }

  return null;
}