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
    // Calcula a soma total dos itens
    double total = itens.fold(0, (soma, item) => soma + item['valor']);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
<<<<<<< HEAD
        ],
      ),
      
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: itens.length,
          // quantidade de itens que serão exibidos
          itemBuilder: (context, index) {
            //nova lista só com os itens da categoria
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
=======
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
>>>>>>> 1dfa5c79d3b7bda7ca9eea517d77426412d0c88c
                },
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            // Lista de produtos
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: ListView.builder(
                  itemCount: itens.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(
                          itens[index]['nome'],
                          style: TextStyle(fontSize: 24),
                        ),
                        subtitle: Text(
                          "R\$ ${itens[index]['valor'].toStringAsFixed(2).replaceAll('.', ',')}",
                          style: TextStyle(
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        leading: Container(
                          width: 50,
                          height: 50,
                          child: Image.asset(
                            itens[index]['imagem'],
                            width: 50,
                            height: 50,
                          ),
                        ),
                        trailing: InkWell(
                          onTap: () {
                            setState(() {
                              itens.removeAt(index);
                            });
                          },
                          child: Icon(
                            Icons.cancel_outlined,
                            color: Colors.red.shade900,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Total: R\$ ${total.toStringAsFixed(2).replaceAll('.', ',')}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 60.0),
                  child: Text(
                    'Finalizar Pedido',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
