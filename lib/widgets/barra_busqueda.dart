import 'package:flutter/material.dart';

class BarraBusqueda extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String hint;

  const BarraBusqueda({
    super.key,
    required this.onChanged,
    this.hint = 'Buscar lugares...',
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: const Icon(Icons.search),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
