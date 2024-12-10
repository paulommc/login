
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



/* // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:login/view/components/my_componets.dart';
import '../model/produtos.dart';

class CardapioView extends StatefulWidget {
  const CardapioView({super.key});

  @override
  State<CardapioView> createState() => _CardapioViewState();
}

class _CardapioViewState extends State<CardapioView> {
//Atributo
  List<Produto> lista = [];
  String categoria = "";
  @override
  void initState() {
     //lista = Produto.gerarProdutos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    categoria = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: MyComponets().GeraAppBar('Categoria', 'Ver seu pedido', true, context),

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
          child: ListView.builder(
            itemCount:
                lista.where((item) => item.categoria == categoria).length,
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
                    "R\$ ${listaFiltrada[index].valor.toStringAsFixed(2).replaceAll('.', ',')}",
                    style: TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                    ),
                  ),

                  //leading: Icon(Icons.contact_page_outlined), // lado esquerdo
                  //leading: Image.network(lista[index].foto),
                  leading: SizedBox(
                    width: 50,
                    height: 50,
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(10), // Define o arredondamento
                      child: Image.asset(
                        listaFiltrada[index].imagem,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover, // Para a imagem ocupar todo o espaço
                      ),
                    ),
                  ),

                  trailing: Icon(Icons.arrow_right), // lado direito
                  hoverColor: Colors.red.shade100,

                  onTap: () {
                    //retornar o item da lista selecionado
                    var dados = listaFiltrada[index];
                    //navegar para a tela DetalhesView
                    Navigator.pushNamed(context, 'detalhes', arguments: dados);
                  },
                ),
              );
            },
          ),
        ),
      ),
    );

    /* return Scaffold(
      appBar: AppBar(title: Text("Categorias")),
      body: StreamBuilder<List<Categoria>>(
        stream: _controller.listarCategorias(),
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

          final categorias = snapshot.data ?? [];
          if (categorias.isEmpty) {
            return Center(child: Text("Nenhuma categoria encontrada."));
          }

          return ListView.builder(
            itemCount: categorias.length,
            itemBuilder: (context, index) {
              final categoria = categorias[index];
              return ListTile(
                title: Text(categoria.nome),
                subtitle: Text(categoria.descricao),
                leading: Image.network(categoria.imagem),
                onTap: () {
                  Navigator.pushNamed(context, 'cardapio',
                      arguments: categoria.nome);
                },
              );
            },
          );
        },
      ),
    ); */

  }
}
 */