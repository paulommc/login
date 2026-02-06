import 'package:login/view/components/mensagem.dart';
import '../model/carrinho.dart';

void finalizarCompra(String uid, context) {
  final carrinho = Carrinho();
  if (carrinho.itens.isEmpty) {
    erro(context, 'O carrinho está vazio.');
    return;
  }
}
