

import 'package:cloud_firestore/cloud_firestore.dart';

class CategoriaController {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Stream<QuerySnapshot> listar({String? categoria}) {
    Query<Map<String, dynamic>> resultado = db.collection('categoria');
    if (categoria != null) {
      resultado = resultado.where('categoria', isEqualTo: categoria);
    }
    return resultado.snapshots();
  }

}