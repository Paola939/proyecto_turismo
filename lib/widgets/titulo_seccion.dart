import 'package:flutter/material.dart';

class TituloSeccion extends StatelessWidget {
  final String texto;
  final String? subtitulo;

  const TituloSeccion({super.key, required this.texto, this.subtitulo});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          texto,
          style: Theme.of(context).textTheme.titleLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        if (subtitulo != null) ...[
          const SizedBox(height: 4),
          Text(subtitulo!, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ],
    );
  }
}
