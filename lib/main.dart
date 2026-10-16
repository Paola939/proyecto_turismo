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
        scaffoldBackgroundColor: const Color(0xFFF7F5EF),

        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF28664A),
          primary: const Color(0xFF28664A),
          secondary: const Color(0xFFE3EBDD),
          surface: Colors.white,
        ),

        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF28664A),
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
            backgroundColor: const Color(0xFF28664A),
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
