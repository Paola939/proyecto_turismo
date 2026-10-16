import 'package:flutter/material.dart';
import '../services/favoritos_service.dart';

class BotonFavorito extends StatelessWidget {
  final int lugarId;
  final FavoritosService favoritosService;
  final bool grande;

  const BotonFavorito({
    super.key,
    required this.lugarId,
    required this.favoritosService,
    this.grande = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: favoritosService,
      builder: (context, _) {
        final favorito = favoritosService.esFavorito(lugarId);
        return IconButton(
          tooltip: favorito ? 'Quitar de favoritos' : 'Agregar a favoritos',
          iconSize: grande ? 30 : 24,
          onPressed: () => favoritosService.alternarFavorito(lugarId),
          icon: Icon(
            favorito ? Icons.favorite : Icons.favorite_border,
            color: favorito ? Colors.redAccent : null,
          ),
        );
      },
    );
  }
}