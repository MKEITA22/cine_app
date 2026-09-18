import 'package:flutter/material.dart';

import 'router/app_router.dart';
import 'theme/theme_controller.dart';

void main() {
  runApp(const CineApp());
}

class CineApp extends StatefulWidget {
  const CineApp({super.key});

  @override
  State<CineApp> createState() => _CineAppState();
}

class _CineAppState extends State<CineApp> {
  @override
  void initState() {
    super.initState();

    themeController.addListener(_themeChanged);
  }

  void _themeChanged() {
    setState(() {});
  }

  @override
  void dispose() {
    themeController.removeListener(_themeChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,

      title: 'CinéApp',

      routerConfig: appRouter,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),

      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),

      themeMode: themeController.themeMode,
    );
  }
}