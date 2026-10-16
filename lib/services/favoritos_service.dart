import 'package:flutter/foundation.dart';

class FavoritosService extends ChangeNotifier {
  final Set<int> _idsFavoritos = <int>{};

  bool esFavorito(int lugarId) => _idsFavoritos.contains(lugarId);

  List<int> get idsFavoritos => List.unmodifiable(_idsFavoritos);

  void alternarFavorito(int lugarId) {
    if (!_idsFavoritos.add(lugarId)) {
      _idsFavoritos.remove(lugarId);
    }
    notifyListeners();
  }
}
