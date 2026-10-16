import 'package:flutter/material.dart';

class BotonPersonalizado extends StatelessWidget {
  final String texto;
  final IconData icono;
  final VoidCallback onPressed;
  final bool anchoCompleto;

  const BotonPersonalizado({
    super.key,
    required this.texto,
    required this.icono,
    required this.onPressed,
    this.anchoCompleto = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: anchoCompleto ? double.infinity : null,
      child: FilledButton.icon(
        onPressed: onPressed,
        icon: Icon(icono),
        label: Text(texto),
        style: FilledButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          backgroundColor: const Color(0xFF28664A),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }
}
