import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/film.dart';
import '../services/film_service.dart';
import '../utils/validators.dart';

class AddFilmScreen extends StatefulWidget {
  final FilmService filmService;

  const AddFilmScreen({
    super.key,
    required this.filmService,
  });

  @override
  State<AddFilmScreen> createState() => _AddFilmScreenState();
}

class _AddFilmScreenState extends State<AddFilmScreen> {
  final _formKey = GlobalKey<FormState>();

  final _titreController = TextEditingController();
  final _genreController = TextEditingController();
  final _anneeController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _titreController.dispose();
    _genreController.dispose();
    _anneeController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _ajouterFilm() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final film = Film(
      id: DateTime.now()
          .microsecondsSinceEpoch
          .toString(),
      titre: _titreController.text.trim(),
      genre: _genreController.text.trim(),
      annee: int.parse(
        _anneeController.text.trim(),
      ),
      description: _descriptionController.text.trim().isEmpty
          ? 'Aucune description.'
          : _descriptionController.text.trim(),
    );

    widget.filmService.ajouterFilm(film);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Film ajouté avec succès !'),
      ),
    );

    context.goNamed('films');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajouter un film'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
              const SizedBox(height: 24),
              TextFormField(
                controller: _titreController,
                validator: validateTitre,
                decoration: const InputDecoration(
                  labelText: 'Titre',
                  hintText: 'Ex : Matrix',
                  prefixIcon: Icon(Icons.movie),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _genreController,
                validator: validateGenre,
                decoration: const InputDecoration(
                  labelText: 'Genre',
                  hintText: 'Ex : Science-fiction',
                  prefixIcon: Icon(Icons.category),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _anneeController,
                validator: validateAnnee,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Année',
                  hintText: 'Ex : 2020',
                  prefixIcon: Icon(Icons.calendar_today),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                maxLines: 4,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  hintText: 'Décrivez le film...',
                  prefixIcon: Icon(Icons.description),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: _ajouterFilm,
                icon: const Icon(Icons.save),
                label: const Text('Enregistrer le film'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}