import 'package:go_router/go_router.dart';

import '../models/film.dart';
import '../screens/add_film_screen.dart';
import '../screens/detail_screen.dart';
import '../screens/films_screen.dart';
import '../screens/home_screen.dart';
import '../screens/settings_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',

  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) {
        return const HomeScreen();
      },
    ),

    GoRoute(
      path: '/films',
      name: 'films',
      builder: (context, state) {
        return const FilmsScreen();
      },
    ),

    GoRoute(
      path: '/detail',
      name: 'detail',
      builder: (context, state) {
        final film = state.extra as Film;

        return DetailScreen(
          film: film,
        );
      },
    ),

    GoRoute(
      path: '/add',
      name: 'add',
      builder: (context, state) {
        return const AddFilmScreen();
      },
    ),

    GoRoute(
      path: '/settings',
      name: 'settings',
      builder: (context, state) {
        return const SettingsScreen();
      },
    ),
  ],
);