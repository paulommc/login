// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

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
    double total = itens.fold(
        0, (soma, item) => soma + (item['valor'] * item['quantidade']));
    if (itens.isEmpty) {
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
          body: Column(
            children: [
              SizedBox(height: 300),
              Center(
                child: Text(
                  'Seu carrinho está vazio.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.grey.shade600),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
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
                          leading: SizedBox(
                            width: 50,
                            height: 50,
                            child: Image.asset(
                              itens[index]['imagem'],
                              width: 50,
                              height: 50,
                            ),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize
                                .min, // Importante para limitar o espaço
                            children: [
                              InkWell(
                                //Remover quantidade
                                onTap: () {
                                  setState(
                                    () {
                                      if (itens[index]['quantidade'] > 1) {
                                        itens[index]['quantidade'] -= 1;
                                      }
                                    },
                                  );
                                },
                                child: Icon(
                                  Icons.remove_circle_outline,
                                  size: 30,
                                  color: Colors.red.shade900,
                                ),
                              ),

                              Text(
                                itens[index]['quantidade'].toString(),
                                style: TextStyle(
                                  color: Colors.red.shade900,
                                  fontSize: 16,
                                ),
                              ),
                              InkWell(
                                //Adicionar quantidade
                                onTap: () {
                                  setState(
                                    () {
                                      itens[index]['quantidade'] += 1;
                                    },
                                  );
                                },
                                child: Icon(
                                  Icons.add_circle_outline,
                                  size: 30,
                                  color: Colors.green.shade900,
                                ),
                              ),
                              SizedBox(
                                  width:
                                      12), // Espaçamento entre o texto e o ícone
                              InkWell(
                                // Remover Item do carrinho
                                onTap: () {
                                  setState(
                                    () {
                                      itens.removeAt(index);
                                    },
                                  );
                                },
                                child: Icon(
                                  Icons.cancel_outlined,
                                  size: 30,
                                  color: Colors.red.shade900,
                                ),
                              ),
                            ],
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
}
