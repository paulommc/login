
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:login/view/components/my_componets.dart';
import '../model/produtos.dart';

class CardapioView extends StatefulWidget {
  const CardapioView({super.key});

  @override
  State<CardapioView> createState() => _CardapioViewState();
}

class _CardapioViewState extends State<CardapioView> {
  // Atributos
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String categoria = "";

  @override
  Widget build(BuildContext context) {
    categoria = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      // Mantém a estética atual do AppBar
      appBar: MyComponets().GeraAppBar(
          'Categoria: $categoria', 'Ver seu pedido', true, context),

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
        child: Padding(
          padding: EdgeInsets.all(10),
          // StreamBuilder para carregar itens do Firestore dinamicamente
          child: StreamBuilder<List<Produto>>(
            stream: _listarItensPorCategoria(categoria),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    "Erro: ${snapshot.error}",
                    style: TextStyle(color: Colors.red),
                  ),
                );
              }

              final itens = snapshot.data ?? [];
              if (itens.isEmpty) {
                return Center(child: Text("Nenhum item encontrado."));
              }

              // Exibição dos itens no estilo atual
              return ListView.builder(
                itemCount: itens.length,
                itemBuilder: (context, index) {
                  final item = itens[index];
                  return Card(
                    child: ListTile(
                      title: Text(
                        item.nome,
                        style: TextStyle(fontSize: 24),
                      ),
                      subtitle: Text(
                        "R\$ ${item.valor.toStringAsFixed(2).replaceAll('.', ',')}",
                        style: TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      leading: SizedBox(
                        width: 50,
                        height: 50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            item.imagem,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                Icon(Icons.broken_image, size: 50),
                          ),
                        ),
                      ),
                      trailing: Icon(Icons.arrow_right),
                      hoverColor: Colors.red.shade100,
                      onTap: () {
                        // Navega para a tela de detalhes com o item selecionado
                        Navigator.pushNamed(context, 'detalhes',
                            arguments: item);
                      },
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  // Função para buscar itens por categoria no Firestore
  Stream<List<Produto>> _listarItensPorCategoria(String categoria) {
    return _firestore
        .collection('itens_cardapio')
        .where('categoria', isEqualTo: categoria.toLowerCase()) // Categoria em minúsculas
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        return Produto.fromJson(data);
      }).toList();
    });
  }
}