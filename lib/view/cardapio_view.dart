// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../model/produtos.dart';

class CardapioView extends StatefulWidget {
  const CardapioView({super.key});

  @override
  State<CardapioView> createState() => _CardapioViewState();
}

class _CardapioViewState extends State<CardapioView> {
//Atributo
  List<Produtos> lista = [];
  String categoria = "";
  @override
  void initState() {
    lista = Produtos.gerarProdutos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    categoria = ModalRoute.of(context)!.settings.arguments as String;
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
        title: Text(categoria),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              color: Colors.orange,
              tooltip: 'Ver seu pedido',
              onPressed: () {
                Navigator.pushNamed(context, 'carrinho');
              },
            ),
          ),
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
          itemCount: lista.where((item) => item.categoria == categoria).length,
          // quantidade de itens que serão exibidos

          itemBuilder: (context, index) {
            //nova lista só com is itens da categoria
            var listaFiltrada =
                lista.where((item) => item.categoria == categoria).toList();
            return Card(
              child: ListTile(
                title: Text(
                  listaFiltrada[index].nome,
                  style: TextStyle(fontSize: 24),
                ),

                subtitle: Text(
                  "R\$ ${listaFiltrada[index].valor.toStringAsFixed(2)}",
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
                    listaFiltrada[index].imagem,
                    width: 50,
                    height: 50,
                  ),
                ),

                trailing: Icon(Icons.arrow_right), // lado direito
                hoverColor: Colors.red.shade100,

                onTap: () {
                  //retornar o item da lista selecionado
                  var dados = listaFiltrada[
                      index];
                  //navegar para a tela DetalhesView
                  Navigator.pushNamed(context, 'detalhes', arguments: dados);
                },
              ),
            );
          },
        ),
        //------------------
      ),
    );
  }
}
