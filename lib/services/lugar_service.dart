import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/lugar.dart';

class LugarService {
  Future<List<Lugar>> cargarLugares() async {
    final String contenido = await rootBundle.loadString('assets/data/lugares.json');
    final dynamic datos = jsonDecode(contenido);

    if (datos is! List) {
      throw const FormatException('El archivo JSON debe contener una lista de lugares.');
    }

    return datos
        .map((item) => Lugar.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}
