// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:login/model/carrinho.dart';
import '../model/produtos.dart';
//import '../model/carrinho.dart';

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
          title: Text(
            dados.nome,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
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
        body: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(
                      255, 255, 227, 212), // Começa com uma cor mais clara
                  const Color.fromARGB(
                      255, 255, 198, 168), // Termina com uma cor mais escura
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(
                    dados.imagem,
                    width: 250,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
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
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    dados.descricao,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black
                      ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(height: 50),
                ListTile(
                  title: Text(
                    'Valor:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "R\$ ${dados.valor.toStringAsFixed(2).replaceAll('.', ',')}",
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
                    //var itensCarrinho = Carrinho();
                    int posicao = Carrinho()
                        .itens
                        .indexWhere((item) => item['nome'] == dados.nome);
                    // verifica se o nome do produto ja existe no carrinho
                    if (posicao == -1) {
                      //se não existe adiciona o produto
                      Carrinho().itens.add({
                        'nome': dados.nome,
                        'valor': dados.valor,
                        'imagem': dados.imagem,
                        'quantidade': 1,
                      });
                    } else {
                      // se ja existir adiciona 1 n quantidade
                      Carrinho().itens[posicao]['quantidade'] += 1;
                    }
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
      ),
    );
  }
}
