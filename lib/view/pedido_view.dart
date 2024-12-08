import 'package:login/view/components/mensagem.dart';

import '../controller/pedido_controller.dart';
import '../model/carrinho.dart';

void finalizarCompra(String uid, context) {
  final carrinho = Carrinho();
  if (carrinho.itens.isEmpty) {
    erro(context, 'O carrinho está vazio.');
    return;
  }
  
/*   PedidoController().criarPedido(uid, carrinho.itens).then((_) {
    carrinho.itens.clear();
    sucesso(context, 'Pedido criado com sucesso!');
  }).catchError((error) {
    erro(context,'Erro ao criar o pedido: $error');
  }); */
}
