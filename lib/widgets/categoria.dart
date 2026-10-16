import 'package:flutter/material.dart';

class ChipCategoria extends StatelessWidget {
  final String categoria;
  final bool seleccionada;
  final VoidCallback onTap;

  const ChipCategoria({
    super.key,
    required this.categoria,
    required this.seleccionada,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ChoiceChip(
        label: Text(categoria),
        selected: seleccionada,
        onSelected: (_) => onTap(),
      ),
    );
  }
}