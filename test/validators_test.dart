import 'package:flutter_test/flutter_test.dart';

import 'package:cine_app/utils/validators.dart';

void main() {
  test('un titre vide est refusé', () {
    expect(validateTitre(''), isNotNull);
  });

  test('un titre valide est accepté', () {
    expect(validateTitre('Matrix'), isNull);
  });

  test('une année invalide est refusée', () {
    expect(validateAnnee('abc'), isNotNull);
  });

  test('une année valide est acceptée', () {
    expect(validateAnnee('2020'), isNull);
  });
}