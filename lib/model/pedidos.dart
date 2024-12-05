//import 'categoria.dart';
// ignore_for_file: non_constant_identifier_names

import 'package:login/model/produtos.dart';

class Pedido {
  final String uid;
  final bool status;
  final DateTime data_hora;
  final Produtos itens;

  Pedido(this.uid, this.status, this.data_hora, this.itens);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'uid': uid,
      'status': status,
      'data_hora': data_hora,
      'itens': itens,
    };
  }

  factory Pedido.fromJson(Map<String, dynamic> json) {
    return Pedido(
      json['uid'],
      json['status'],
      json['data_hora'],
      json['itens'],
    );
  }
}
