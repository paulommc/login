import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:login/controller/login_controller.dart';

class PedidoController {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<void> finalizarPedido(List<Map<String, dynamic>> itens, String uid) async {
    if (itens.isEmpty) throw Exception("Carrinho vazio!");

    await db.collection('pedidos').add({
      'uid': uid,
      'status': 'finalizado',
      'data_hora': DateTime.now().toIso8601String(),
      'itens': itens.map((item) => {
        'item_id': item['item_id'],
        'preco': item['valor'],
        'quantidade': item['quantidade'],
      }).toList(),
    });
  }
}


/* class PedidoController {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<void> adicionarItemAoPedido(
      String pedidoId, String itemId, double preco, int quantidade) async {
    final pedidoRef = db.collection('pedidos').doc(pedidoId);

    final pedidoSnapshot = await pedidoRef.get();
    if (!pedidoSnapshot.exists) {
      await pedidoRef.set({
        'uid': LoginController().idUsuario(),
        'status': 'preparando',
        'data_hora': DateTime.now().toIso8601String(),
        'itens': [],
      });
    }

    pedidoRef.update({
      'itens': FieldValue.arrayUnion([
        {'item_id': itemId, 'preco': preco, 'quantidade': quantidade}
      ])
    });
  }
} */
