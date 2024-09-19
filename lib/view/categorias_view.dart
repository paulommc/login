// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../model/categoria.dart';

class CategoriasView extends StatefulWidget {
  const CategoriasView({super.key});

  @override
  State<CategoriasView> createState() => _CategoriasViewState();
}

class _CategoriasViewState extends State<CategoriasView> {
  //atributo
  List<Categoria> lista = [];

  @override
  void initState() {
    lista = Categoria.gerarCategoria();
    super.initState();
  }

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
        title: Text('Selecione a Categoria'),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              color: Colors.orange,
              tooltip: 'Ver seu pedido',
              onPressed: () {
                Navigator.pushNamed(context, 'carrinho');
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 por linha
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 3 / 2,
          ),
          itemCount: lista.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: InkWell(
                onTap: () {
                  //retornar o item da lista selecionado
                  var dados = lista[index].catNome;
                  //navegar para a tela DetalhesView
                  Navigator.pushNamed(context, 'cardapio', arguments: dados);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      lista[index].catImagem,
                      width: 50,
                      height: 50,
                    ),
                    SizedBox(height: 10),
                    Text(
                      lista[index].catNome,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
