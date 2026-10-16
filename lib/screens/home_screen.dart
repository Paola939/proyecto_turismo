import 'package:flutter/material.dart';

import '../widgets/boton_personalizado.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _mostrarMensaje(BuildContext context, String seccion) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$seccion estará disponible próximamente.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F5EF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF28664A),
        foregroundColor: Colors.white,
        title: const Text(
          'Descubre Tlaxiaco',
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
                onTap: () => _mostrarMensaje(context, 'Lugares turísticos'),
              ),
              _OpcionInicio(
                icono: Icons.favorite_border,
                titulo: 'Mis favoritos',
                descripcion: 'Consulta los lugares que te gustan.',
                onTap: () => _mostrarMensaje(context, 'Favoritos'),
              ),
              _OpcionInicio(
                icono: Icons.info_outline,
                titulo: 'Acerca de la aplicación',
                descripcion: 'Conoce el propósito de este proyecto.',
                onTap: () => _mostrarMensaje(context, 'Acerca de'),
              ),
              const SizedBox(height: 20),
              BotonPersonalizado(
                texto: 'Comenzar a explorar',
                icono: Icons.explore_outlined,
                onPressed: () => _mostrarMensaje(context, 'Catálogo turístico'),
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
