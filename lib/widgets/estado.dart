import 'package:flutter/material.dart';

class EstadoVacio extends StatelessWidget {
  final String titulo;
  final String mensaje;
  final IconData icono;

  const EstadoVacio({
    super.key,
    required this.titulo,
    required this.mensaje,
    this.icono = Icons.search_off,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icono, size: 58, color: const Color.fromARGB(255, 228, 39, 26)),
            const SizedBox(height: 12),
            Text(titulo, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Text(mensaje, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}