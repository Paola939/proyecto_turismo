import 'package:flutter/material.dart';

import '../models/lugar.dart';
import '../services/favoritos_service.dart';
import '../widgets/boton_favorito.dart';
import '../widgets/fila_informacion.dart';
import '../widgets/imagen_lugar.dart';

class DetalleLugarScreen extends StatelessWidget {
  final Lugar lugar;
  final FavoritosService favoritosService;

  const DetalleLugarScreen({
    super.key,
    required this.lugar,
    required this.favoritosService,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 280,
            pinned: true,
            title: Text(
              lugar.nombre,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: ImagenLugar(url: lugar.imagen, altura: 300),
            ),
            actions: [
              BotonFavorito(
                lugarId: lugar.id,
                favoritosService: favoritosService,
                grande: true,
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Chip(label: Text(lugar.categoria)),
                  const SizedBox(height: 12),
                  Text(
                    lugar.nombre,
                    style: Theme.of(context).textTheme.headlineSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    lugar.descripcion,
                    style: const TextStyle(fontSize: 16, height: 1.6),
                  ),
                  const SizedBox(height: 24),
                  const Divider(),
                  FilaInformacion(
                    icono: Icons.location_on_outlined,
                    texto: lugar.ubicacion,
                  ),
                  FilaInformacion(
                    icono: Icons.category_outlined,
                    texto: lugar.categoria,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
