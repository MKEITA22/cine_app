import 'package:flutter/material.dart';

class AddFilmScreen extends StatefulWidget {
  const AddFilmScreen({super.key});

  @override
  State<AddFilmScreen> createState() =>
      _AddFilmScreenState();
}

class _AddFilmScreenState
    extends State<AddFilmScreen> {
  final GlobalKey<FormState> formKey =
      GlobalKey<FormState>();

  final TextEditingController titreController =
      TextEditingController();

  final TextEditingController genreController =
      TextEditingController();

  final TextEditingController anneeController =
      TextEditingController();

  @override
  void dispose() {
    titreController.dispose();
    genreController.dispose();
    anneeController.dispose();

    super.dispose();
  }

  void enregistrerFilm() {
    if (formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context)
          .showSnackBar(
        const SnackBar(
          content: Text(
            'Film ajouté avec succès !',
          ),
        ),
      );

      titreController.clear();
      genreController.clear();
      anneeController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ajouter un film',
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Form(
          key: formKey,

          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [
              Text(
                'Nouveau film',

                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),

              const SizedBox(height: 25),

              TextFormField(
                controller: titreController,

                decoration:
                    const InputDecoration(
                  labelText: 'Titre',

                  hintText:
                      'Exemple : Inception',

                  prefixIcon:
                      Icon(Icons.movie),

                  border:
                      OutlineInputBorder(),
                ),

                validator: (value) {
                  if (value == null ||
                      value.trim().isEmpty) {
                    return 'Le titre est obligatoire.';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 18),

              TextFormField(
                controller: genreController,

                decoration:
                    const InputDecoration(
                  labelText: 'Genre',

                  hintText:
                      'Exemple : Action',

                  prefixIcon:
                      Icon(Icons.category),

                  border:
                      OutlineInputBorder(),
                ),

                validator: (value) {
                  if (value == null ||
                      value.trim().isEmpty) {
                    return 'Le genre est obligatoire.';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 18),

              TextFormField(
                controller: anneeController,

                keyboardType:
                    TextInputType.number,

                decoration:
                    const InputDecoration(
                  labelText: 'Année',

                  hintText:
                      'Exemple : 2024',

                  prefixIcon:
                      Icon(Icons.calendar_today),

                  border:
                      OutlineInputBorder(),
                ),

                validator: (value) {
                  if (value == null ||
                      value.trim().isEmpty) {
                    return 'L’année est obligatoire.';
                  }

                  final annee =
                      int.tryParse(value);

                  if (annee == null) {
                    return 'Entrez une année valide.';
                  }

                  if (annee < 1900 ||
                      annee > 2100) {
                    return 'Année entre 1900 et 2100.';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,

                child:
                    ElevatedButton.icon(
                  onPressed: enregistrerFilm,

                  icon: const Icon(
                    Icons.save,
                  ),

                  label: const Text(
                    'Enregistrer',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}