// ignore_for_file: prefer_const_constructors, unused_element, avoid_print

//NOVO
import 'package:flutter/material.dart';
import 'package:login/model/carrinho.dart';
import 'package:login/view/components/mensagem.dart';
import '../controller/produto_controller.dart';
import '../model/produtos.dart';

class ProdutosPage extends StatelessWidget {
  final String categoriaId;

  ProdutosPage({required this.categoriaId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Itens da Categoria')),
      body: StreamBuilder<List<Produtos>>(
        stream: ProdutosController().listarItensPorCategoria(categoriaId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Nenhum item encontrado.'));
          }

          final itens = snapshot.data!;
          return ListView.builder(
            itemCount: itens.length,
            itemBuilder: (context, index) {
              final item = itens[index];
              return ListTile(
                leading: Image.network(item.imagem, width: 50, height: 50),
                title: Text(item.nome),
                subtitle: Text('R\$ ${item.valor.toStringAsFixed(2)}'),
                onTap: () {
                  // Lógica para adicionar ao carrinho ou visualizar detalhes
                  void adicionarAoCarrinho(Produtos produto, int quantidade) {
                    final carrinho = Carrinho();
                    carrinho.itens.add({
                      'produto': produto.toJson(),
                      'quantidade': quantidade,
                    });
                    sucesso(context, 'Item adicionado ao carrinho: ${produto.nome}');
                  }
                },
              );
            },
          );
        },
      ),
    );
  }
}
