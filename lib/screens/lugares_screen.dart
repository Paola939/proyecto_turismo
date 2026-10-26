import 'package:flutter/material.dart';

import '../models/lugar.dart';
import '../services/favoritos_service.dart';
import '../widgets/barra_busqueda.dart';
import '../widgets/categoria.dart';
import '../widgets/estado.dart';
import '../widgets/tarjeta_lugar.dart';
import 'detalle_lugar_screen.dart';

class LugaresScreen extends StatefulWidget {
  final List<Lugar> lugares;
  final FavoritosService favoritosService;

  const LugaresScreen({
    super.key,
    required this.lugares,
    required this.favoritosService,
  });

  @override
  State<LugaresScreen> createState() => _LugaresScreenState();
}

class _LugaresScreenState extends State<LugaresScreen> {
  String busqueda = '';
  String categoriaSeleccionada = 'Todos';

  List<String> get categorias {
    final categoriasUnicas =
        widget.lugares.map((lugar) => lugar.categoria).toSet().toList()..sort();

    return ['Todos', ...categoriasUnicas];
  }

  List<Lugar> get lugaresFiltrados {
    return widget.lugares.where((lugar) {
      final texto = [
        lugar.nombre,
        lugar.descripcion,
        lugar.ubicacion,
      ].join(' ').toLowerCase();

      final coincideTexto = texto.contains(busqueda.trim().toLowerCase());

      final coincideCategoria =
          categoriaSeleccionada == 'Todos' ||
          lugar.categoria == categoriaSeleccionada;

      return coincideTexto && coincideCategoria;
    }).toList();
  }

  void _abrirDetalle(Lugar lugar) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetalleLugarScreen(
          lugar: lugar,
          favoritosService: widget.favoritosService,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final resultados = lugaresFiltrados;

    return Scaffold(

      appBar: AppBar(title: const Text('Lugares de Interés')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: BarraBusqueda(
              onChanged: (valor) {
                setState(() {
                  busqueda = valor;
                });
              },
            ),
          ),

          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: categorias.map((categoria) {
                return ChipCategoria(
                  categoria: categoria,
                  seleccionada: categoria == categoriaSeleccionada,
                  onTap: () {
                    setState(() {
                      categoriaSeleccionada = categoria;
                    });
                  },
                );
              }).toList(),
            ),
          ),

          const SizedBox(height: 8),

          Expanded(
            child: resultados.isEmpty
                ? const EstadoVacio(
                    titulo: 'No se encontraron lugares',
                    mensaje:
                        'Prueba con otra palabra o selecciona otra categoría.',
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: resultados.length,
                    itemBuilder: (context, index) {
                      final lugar = resultados[index];

                      return TarjetaLugar(
                        lugar: lugar,
                        favoritosService: widget.favoritosService,
                        onTap: () => _abrirDetalle(lugar),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
