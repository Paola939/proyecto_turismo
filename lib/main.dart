import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'services/favoritos_service.dart';

void main() {
  runApp(const DescubreTlaxiacoApp());
}

class DescubreTlaxiacoApp extends StatefulWidget {
  const DescubreTlaxiacoApp({super.key});

  @override
  State<DescubreTlaxiacoApp> createState() => _DescubreTlaxiacoAppState();
}

class _DescubreTlaxiacoAppState extends State<DescubreTlaxiacoApp> {
  late final FavoritosService favoritosService;

  @override
  void initState() {
    super.initState();
    favoritosService = FavoritosService();
  }

  @override
  void dispose() {
    favoritosService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Descubre Tlaxiaco',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color.fromARGB(255, 240, 239, 225),

        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 29, 53, 192),
          primary: const Color.fromARGB(255, 94, 88, 185),
          secondary: const Color.fromARGB(255, 29, 53, 192),
          surface: Colors.white,
        ),

        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 70, 91, 184),
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
        ),

        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 68, 100, 204),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        ),
      ),

      home: HomeScreen(favoritosService: favoritosService),
    );
  }
}
