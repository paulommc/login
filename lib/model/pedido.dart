//import 'categoria.dart';
// ignore_for_file: non_constant_identifier_names

import 'package:login/model/produtos.dart';

//Pedido
class Pedido {
  final String uid;
  final bool status;
  final DateTime data_hora;
  List<ItemPedido>itens;


  Pedido({required this.uid, required this.status, required this.data_hora, required this.itens});

  factory Pedido.fromMap(Map<String, dynamic> map) {
    return Pedido(
      uid: map['uid'],
      status: map['status'],
      data_hora: map['data_hora'],
      itens: List<ItemPedido>.from(
        map['itens']?.map((item) => ItemPedido.fromMap(item)) ?? [],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'uid': uid,
      'status': status,
      'data_hora': data_hora,
      'itens': itens.map((item) => item.toMap()).toList(),
    };
  }

  static fromJson(Map<String, dynamic> data) {}

}

class ItemPedido {
  String item_id;
  String nome;
  String imagem;
  double valor;
  int quantidade;
  String status;

  ItemPedido({required this.item_id, required this.nome, required this.imagem, required this.valor, required this.quantidade, required this.status,
  });

  factory ItemPedido.fromMap(Map<String, dynamic> map) {
    return ItemPedido(
      item_id: map['item_id'],
      nome: map['nome'],
      imagem: map['imagem'],
      valor: map['preco'],
      quantidade: map['quantidade'],
      status: map['status'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'item_id': item_id,
      'nome': nome,
      'imagem': imagem,
      'preco': valor,
      'quantidade': quantidade,
      'status': status,
    };
  }
}
