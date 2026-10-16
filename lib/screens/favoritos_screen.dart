import 'package:flutter/material.dart';

import '../models/lugar.dart';
import '../services/favoritos_service.dart';
import '../widgets/estado.dart';
import '../widgets/tarjeta_lugar.dart';
import 'detalle_lugar_screen.dart';

class FavoritosScreen extends StatelessWidget {
  final List<Lugar> lugares;
  final FavoritosService favoritosService;

  const FavoritosScreen({
    super.key,
    required this.lugares,
    required this.favoritosService,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mis favoritos')),
      body: ListenableBuilder(
        listenable: favoritosService,
        builder: (context, _) {
          final favoritos = lugares
              .where((lugar) => favoritosService.esFavorito(lugar.id))
              .toList();
          if (favoritos.isEmpty) {
            return const EstadoVacio(
              icono: Icons.favorite_border,
              titulo: 'Aún no tienes favoritos',
              mensaje: 'Agrega lugares usando el corazón de cada tarjeta.',
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: favoritos.length,
            itemBuilder: (context, index) {
              final lugar = favoritos[index];
              return TarjetaLugar(
                lugar: lugar,
                favoritosService: favoritosService,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetalleLugarScreen(
                      lugar: lugar,
                      favoritosService: favoritosService,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
