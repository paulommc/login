import 'package:cloud_firestore/cloud_firestore.dart';

class PedidoController {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<void> finalizarPedido(
      List<Map<String, dynamic>> itens, String uid) async {
    if (itens.isEmpty) throw Exception("Carrinho vazio!");

    // Cria o documento de pedido no Firestore
    await db.collection('pedidos').add({
      'uid': uid,
      'status': false, // Status inicial como não finalizado
      'data_hora': DateTime.now().toIso8601String(),
      'itens': itens.map((item) => {
            'item_id': item['item_id'] ?? '',
            'nome': item['nome'],
            'imagem': item['imagem'],
            'preco': item['valor'],
            'quantidade': item['quantidade'],
            'status': 'finalizado', // Status inicial do item
          }).toList(),
    });
  }
}