import 'package:flutter/material.dart';
import '../utils/constantes.dart';
import '../widgets/boton_personalizado.dart';

class AcercaDeScreen extends StatelessWidget {
  const AcercaDeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Descripcion de')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const CircleAvatar(
            radius: 48,
            backgroundColor: ConstantesApp.verdeClaro,
            child: Icon(Icons.travel_explore, size: 52, color: ConstantesApp.verde),
          ),
          const SizedBox(height: 22),
          Text(
            ConstantesApp.nombreApp,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const Text(
            'Aplicación turística de demostración que busca reunir información '
            'sobre lugares, cultura y tradiciones de Tlaxiaco y la región Mixteca.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, height: 1.6),
          ),
          const SizedBox(height: 24),
          BotonPersonalizado(
            texto: 'Volver al inicio',
            icono: Icons.home_outlined,
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
