import 'package:flutter/material.dart';

class IndicadorCarga extends StatelessWidget {
  final String mensaje;

  const IndicadorCarga({super.key, this.mensaje = 'Cargando lugares...'});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: 14),
          Text(mensaje),
        ],
      ),
    );
  }
}
