import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:login/view/components/mensagem.dart';

import '../model/pedidos.dart';
import 'login_controller.dart';

class PedidoController {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  adicionar(context, Pedido p) {

    db.collection('pedidos')
      .add(p.toJson())
      .then((value)=>
        sucesso(context, 'Pedido adicionado com sucesso!'))
      .catchError((e) =>
        erro(context, 'Não foi possível adicionar o pedido'))
      .whenComplete(()=> Navigator.pop(context));

  }

  atualizar(context, uid,Pedido p) {

    db.collection('pedidos')
      .doc(uid)
      .update(p.toJson())
      .then((value)=>
        sucesso(context, 'Pedido atualizado com sucesso!'))
      .catchError((e) =>
        erro(context, 'Não foi possível atualizar o pedido'))
      .whenComplete(()=> Navigator.pop(context));
  }

  excluir(context, uid) {
    db.collection('pedidos')
      .doc(uid)
      .delete()
      .then((value)=>
        sucesso(context, 'Pedido excluido com sucesso!'))
      .catchError((e) =>
        erro(context, 'Não foi possível excluir o pedido'));
  }

  Stream<QuerySnapshot> listar() {
    var resultado = db
        .collection('pedidos')
        .where('uid', isEqualTo: LoginController().idUsuario());

    return resultado.snapshots();
  }
}
