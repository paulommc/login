import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:login/model/categoria.dart';

class CategoriaController {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Stream<List<Categoria>> listarCategorias() {
    return db.collection('categorias').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Categoria.fromJson(doc.data())).toList();
    });
  }
}


/* class CategoriaController {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Stream<QuerySnapshot> listar({String? categoria}) {
    Query<Map<String, dynamic>> resultado = db.collection('categorias');
    if (categoria != null) {
      resultado = resultado.where('categoria', isEqualTo: categoria);
    }
    return resultado.snapshots();
  }

  Stream<QuerySnapshot> listarItens(String categoriaId) {
    return db
        .collection('itens_cardapio')
        .where('categoria', isEqualTo: categoriaId)
        .snapshots();
  }
}
 */