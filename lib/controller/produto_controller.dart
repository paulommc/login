// ignore_for_file: unnecessary_cast

import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/produtos.dart';

class ProdutosController {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Stream<List<Produtos>> listarItensPorCategoria(String categoriaId) {
    return db
        .collection('itens_cardapio')
        .where('categoria', isEqualTo: categoriaId)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs
              .map((doc) => Produtos.fromJson(doc.data() as Map<String, dynamic>))
              .toList();
        });
  }
}
