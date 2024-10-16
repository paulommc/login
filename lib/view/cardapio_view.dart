// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

//import 'package:login/model/customAppBar.dart';
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
          //------------------
        ),
      ),
    );
  }
}
