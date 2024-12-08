import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:login/controller/login_controller.dart';

class PedidoController {
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
}
