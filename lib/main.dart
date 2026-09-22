import 'package:flutter/material.dart';

import 'data/film_data.dart';
import 'repositories/film_repository.dart';
import 'router/app_router.dart';
import 'services/film_service.dart';
import 'theme/theme_controller.dart';

void main() {
  final repository =
      InMemoryFilmRepository(filmsInitiaux);

  final filmService = FilmService(repository);

  final router = createAppRouter(filmService);

  runApp(
    CineApp(
      router: router,
    ),
  );
}

class CineApp extends StatelessWidget {
  final RouterConfig<Object> router;

  const CineApp({
    super.key,
    required this.router,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: themeController,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'CineApp',
          debugShowCheckedModeBanner: false,
          routerConfig: router,
          theme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.light,
            colorSchemeSeed: Colors.indigo,
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.dark,
            colorSchemeSeed: Colors.indigo,
          ),
          themeMode: themeController.themeMode,
        );
      },
    );
  }
}