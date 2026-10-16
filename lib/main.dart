import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const DescubreTlaxiacoApp());
}

class DescubreTlaxiacoApp extends StatelessWidget {
  const DescubreTlaxiacoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Descubre Tlaxiaco',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF28664A)),
        fontFamily: 'Roboto',
      ),
      home: const HomeScreen(),
    );
  }
}
