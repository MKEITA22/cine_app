import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/film_data.dart';
import 'repositories/film_repository.dart';
import 'router/app_router.dart';
import 'services/film_service.dart';
import 'theme/theme_controller.dart';

void main() {
  final repository =
      InMemoryFilmRepository(filmsInitiaux);

  final filmService = FilmService(repository);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeController>(
          create: (_) => ThemeController(),
        ),

        ChangeNotifierProvider<FilmService>.value(
          value: filmService,
        ),
      ],
      child: const CineApp(),
    ),
  );
}

class CineApp extends StatelessWidget {
  const CineApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = createAppRouter();

    return Consumer<ThemeController>(
      builder: (context, themeController, child) {
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