// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../model/carrinho.dart';

class CarrinhoView extends StatefulWidget {
  const CarrinhoView({super.key});

  @override
  State<CarrinhoView> createState() => _CarrinhoViewState();
}

class _CarrinhoViewState extends State<CarrinhoView> {
  List<Map<String, dynamic>> itens = Carrinho().itens;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.orange,
          ),
        ),
        title: Text('Seu Pedido'),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: const Icon(Icons.logout),
              color: Colors.orange,
              tooltip: 'Sair',
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, 'login', (Route<dynamic> route) => false);
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: itens.length,
          // quantidade de itens que serão exibidos
          itemBuilder: (context, index) {
            //nova lista só com is itens da categoria
            return Card(
              child: ListTile(
                title: Text(
                  itens[index]['nome'],
                  style: TextStyle(fontSize: 24),
                ),
                subtitle: Text(
                  "R\$ ${itens[index]['valor'].toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                //leading: Icon(Icons.contact_page_outlined), // lado esquerdo
                //leading: Image.network(lista[index].foto),
                leading: Container(
                  width: 50,
                  height: 50,
                  child: Image.asset(
                    itens[index]['imagem'],
                    width: 50,
                    height: 50,
                  ),
                ),
                trailing: Icon(Icons.arrow_right), // lado direito
                hoverColor: Colors.red.shade100,

                onTap: () {
                  //retornar o item da lista selecionado
                  // var dados =
                  //     lista[index]; //usa a lista original para buscar o produto
                  // //navegar para a tela DetalhesView
                  // Navigator.pushNamed(context, 'detalhes', arguments: dados);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
