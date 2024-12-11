import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:login/model/categoria.dart';

class CategoriaController {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Stream<List<Categoria>> listarCategorias() {
    return db
        .collection('categorias')
        .orderBy('ordem',
            descending: false) // Ordena pelo campo 'ordem' em ordem crescente
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => Categoria.fromJson(doc.data()))
          .toList();
    });
  }
}