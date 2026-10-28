import 'package:flutter/material.dart';

class FilaInformacion extends StatelessWidget {
  final IconData icono;
  final String texto;

  const FilaInformacion({super.key, required this.icono, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icono, color: const Color.fromARGB(255, 70, 63, 173)),
          const SizedBox(width: 10),
          Expanded(child: Text(texto)),
        ],
      ),
    );
  }
}
