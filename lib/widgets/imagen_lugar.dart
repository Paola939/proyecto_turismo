import 'package:flutter/material.dart';

class ImagenLugar extends StatelessWidget {
  final String url;
  final double altura;
  final double? ancho;

  const ImagenLugar({
    super.key,
    required this.url,
    this.altura = 190,
    this.ancho,
  });

  @override
  Widget build(BuildContext context) {
    if (url.isEmpty) {
      return _placeholder();
    }
    return Image.network(
      url,
      height: altura,
      width: ancho ?? double.infinity,
      fit: BoxFit.cover,
      errorBuilder: (_, __, ___) => _placeholder(),
      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;
        return SizedBox(
          height: altura,
          child: const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget _placeholder() {
    return Container(
      height: altura,
      width: ancho ?? double.infinity,
      color: const Color.fromARGB(255, 84, 67, 235),
      alignment: Alignment.center,
      child: const Icon(Icons.landscape, size: 56, color: Color(0xFF28664A)),
    );
  }
}
