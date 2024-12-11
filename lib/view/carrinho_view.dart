// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:login/controller/login_controller.dart';
import 'package:login/controller/pedido_controller.dart';
import 'package:login/view/components/mensagem.dart';
import 'package:login/view/components/my_componets.dart';
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
    double total = itens.fold(
        0, (soma, item) => soma + (item['valor'] * item['quantidade']));

    if (itens.isEmpty) {
      return Scaffold(
        appBar: MyComponets().GeraAppBar('Seu Pedido', '', false, context),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 255, 227, 212),
                const Color.fromARGB(255, 255, 198, 168),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: Text(
              'Seu carrinho está vazio.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.grey.shade600),
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: MyComponets().GeraAppBar('Seu Pedido', '', false, context),
        body: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 255, 227, 212),
                const Color.fromARGB(255, 255, 198, 168),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
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
                            style: TextStyle(fontSize: 20),
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
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    if (itens[index]['quantidade'] > 1) {
                                      itens[index]['quantidade'] -= 1;
                                    }
                                  });
                                },
                                child: Icon(
                                  Icons.remove_circle_outline,
                                  size: 30,
                                  color: Colors.red.shade900,
                                ),
                              ),
                              SizedBox(width: 3),
                              Text(
                                itens[index]['quantidade'].toString(),
                                style: TextStyle(
                                  color: Colors.red.shade900,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(width: 3),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    itens[index]['quantidade'] += 1;
                                  });
                                },
                                child: Icon(
                                  Icons.add_circle_outline,
                                  size: 30,
                                  color: Colors.green.shade900,
                                ),
                              ),
                              SizedBox(width: 16),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    itens.removeAt(index);
                                  });
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
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  onPressed: () async {
                    try {
                      await PedidoController().finalizarPedido(
                          Carrinho().itens, LoginController().idUsuario());

                      setState(() {
                        Carrinho().itens.clear();
                      });

                      sucesso(context, "Pedido finalizado com sucesso!");
                    } catch (e) {
                      erro(context, e.toString());
                    }
                  },
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
