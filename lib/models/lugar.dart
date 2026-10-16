class Lugar {
  final int id;
  final String nombre;
  final String categoria;
  final String descripcion;
  final String imagen;
  final String ubicacion;

  const Lugar({
    required this.id,
    required this.nombre,
    required this.categoria,
    required this.descripcion,
    required this.imagen,
    required this.ubicacion,
  });

  factory Lugar.fromJson(Map<String, dynamic> json) {
    return Lugar(
      id: (json['id'] as num).toInt(),
      nombre: json['nombre'] as String? ?? 'Lugar sin nombre',
      categoria: json['categoria'] as String? ?? 'General',
      descripcion: json['descripcion'] as String? ?? '',
      imagen: json['imagen'] as String? ?? '',
      ubicacion: json['ubicacion'] as String? ?? 'Ubicación no disponible',
    );
  }
}
