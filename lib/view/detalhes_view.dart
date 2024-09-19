// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../model/produtos.dart';

class DetalhesView extends StatefulWidget {
  const DetalhesView({super.key});

  @override
  State<DetalhesView> createState() => _DetalhesViewState();
}

class _DetalhesViewState extends State<DetalhesView> {
  final msgKey = GlobalKey<ScaffoldMessengerState>();
  @override
  Widget build(BuildContext context) {
    //receber os dados que foram passados por argumento
    final Produtos dados =
        ModalRoute.of(context)!.settings.arguments as Produtos;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: msgKey,
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
          title: Text(dados.nome),
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
          padding: EdgeInsets.all(10),
          child: ListView(
            children: [
              Image.asset(
                dados.imagem,
                width: 250,
                height: 250,
              ),
              // ListTile(
              //   title: Text(
              //     'Produto:',
              //     style: TextStyle(fontSize: 12),
              //   ),
              //   subtitle: Text(
              //     dados.nome,
              //     style: TextStyle(fontSize: 22),
              //   ),
              // ),
              SizedBox(height: 50),
              ListTile(
                title: Text(
                  'Descrição:',
                  style: TextStyle(fontSize: 12),
                ),
                subtitle: Text(
                  dados.descricao,
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(height: 50),
              ListTile(
                title: Text(
                  'Valor:',
                  style: TextStyle(fontSize: 12),
                ),
                subtitle: Text(
                  "R\$ ${dados.valor.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.right,
                ),
              ),
              // ListTile(
              //   title: Text(
              //     'Cidade',
              //     style: TextStyle(fontSize: 12),
              //   ),
              //   subtitle: Text(
              //     dados.cidade,
              //     style: TextStyle(fontSize: 22),
              //   ),
              // ),
              // Botão "Entrar"
              SizedBox(height: 25),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
                onPressed: () {
                  msgKey.currentState!.showSnackBar(
                    SnackBar(
                      content: Text("${dados.nome} adicionado ao seu pedido"),
                      duration: Duration(seconds: 3),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 60.0),
                  child: Text(
                    'Adicionar ao Pedido',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
