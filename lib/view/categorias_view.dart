// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:login/controller/categoria_controller.dart';
import 'package:login/view/components/my_componets.dart';
import '../model/categoria.dart';

class CategoriasView extends StatefulWidget {
  @override
  _CategoriasViewState createState() => _CategoriasViewState();
}

class _CategoriasViewState extends State<CategoriasView> {
  final CategoriaController _controller = CategoriaController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyComponets().GeraAppBar(
        'Selecione a Categoria',
        'Ver seu pedido',
        true,
        context,
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 255, 227, 212), // Cor clara no topo
              const Color.fromARGB(255, 255, 198, 168), // Cor escura na base
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: StreamBuilder<List<Categoria>>(
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

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Número de itens por linha
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 3 / 2,
                ),
                itemCount: categorias.length,
                itemBuilder: (context, index) {
                  final categoria = categorias[index];
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: InkWell(
                      onTap: () {
                        // Navegar para a tela do cardápio com a categoria selecionada
                        Navigator.pushNamed(
                          context,
                          'cardapio',
                          arguments: categoria.nome,
                        );
                      },
                      child: Stack(
                        children: [
                          // Imagem ocupando todo o card
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              categoria.imagem,
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          // Gradiente e texto sobreposto
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.black.withOpacity(0.1),
                                    Colors.black.withOpacity(0.7),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 10,
                              ),
                              child: Text(
                                categoria.nome,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}