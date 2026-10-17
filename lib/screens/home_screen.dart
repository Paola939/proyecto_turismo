import 'package:flutter/material.dart';

import '../models/lugar.dart';
import '../services/lugar_service.dart';
import '../services/favoritos_service.dart';
import '../widgets/boton_personalizado.dart';
import 'lugares_screen.dart';
import 'favoritos_screen.dart';
import 'descripcion.dart';

class HomeScreen extends StatefulWidget {
  final FavoritosService favoritosService;

  const HomeScreen({super.key, required this.favoritosService});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final Future<List<Lugar>> _lugaresFuture;

  @override
  void initState() {
    super.initState();
    _lugaresFuture = LugarService().cargarLugares();
  }

  void _abrirPantalla(BuildContext context, Widget pantalla) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => pantalla));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F5EF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF28664A),
        foregroundColor: Colors.white,
        title: const Text(
          'Ven y descubre Tlaxiaco',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xFFE3EBDD),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.travel_explore,
                      size: 48,
                      color: Color(0xFF28664A),
                    ),
                    SizedBox(height: 18),
                    Text(
                      'Explora la Mixteca',
                      style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF214B37),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Descubre los lugares, la cultura y las '
                      'tradiciones de Tlaxiaco y sus alrededores.',
                      style: TextStyle(fontSize: 16, height: 1.5),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              const Text(
                '¿Qué quieres descubrir?',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF26352B),
                ),
              ),

              const SizedBox(height: 16),

              _OpcionInicio(
                icono: Icons.place_outlined,
                titulo: 'Lugares turísticos',
                descripcion: 'Explora destinos de la región.',
                onTap: () {
                  _lugaresFuture
                      .then((lugares) {
                        if (!context.mounted) return;

                        _abrirPantalla(
                          context,
                          LugaresScreen(
                            lugares: lugares,
                            favoritosService: widget.favoritosService,
                          ),
                        );
                      })
                      .catchError((error) {
                        if (!context.mounted) return;

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'No se pudieron cargar los lugares turísticos.',
                            ),
                          ),
                        );
                      });
                },
              ),

              _OpcionInicio(
                icono: Icons.favorite_border,
                titulo: 'Mis favoritos',
                descripcion: 'Consulta los lugares que te gustan.',
                onTap: () {
                  _lugaresFuture
                      .then((lugares) {
                        if (!context.mounted) return;

                        _abrirPantalla(
                          context,
                          FavoritosScreen(
                            lugares: lugares,
                            favoritosService: widget.favoritosService,
                          ),
                        );
                      })
                      .catchError((error) {
                        if (!context.mounted) return;

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'No se pudieron cargar los favoritos.',
                            ),
                          ),
                        );
                      });
                },
              ),

              _OpcionInicio(
                icono: Icons.info_outline,
                titulo: 'Acerca de la aplicación',
                descripcion: 'Conoce el propósito de este proyecto.',
                onTap: () {
                  _abrirPantalla(context, const AcercaDeScreen());
                },
              ),

              const SizedBox(height: 20),

              BotonPersonalizado(
                texto: 'Comenzar a explorar',
                icono: Icons.explore_outlined,
                onPressed: () {
                  _lugaresFuture
                      .then((lugares) {
                        if (!context.mounted) return;

                        _abrirPantalla(
                          context,
                          LugaresScreen(
                            lugares: lugares,
                            favoritosService: widget.favoritosService,
                          ),
                        );
                      })
                      .catchError((error) {
                        if (!context.mounted) return;

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'No se pudieron cargar los lugares turísticos.',
                            ),
                          ),
                        );
                      });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _OpcionInicio extends StatelessWidget {
  final IconData icono;
  final String titulo;
  final String descripcion;
  final VoidCallback onTap;

  const _OpcionInicio({
    required this.icono,
    required this.titulo,
    required this.descripcion,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 1,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: CircleAvatar(
          backgroundColor: const Color(0xFFE3EBDD),
          child: Icon(icono, color: const Color(0xFF28664A)),
        ),
        title: Text(
          titulo,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(descripcion),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
