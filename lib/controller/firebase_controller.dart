import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> inicializarDados() async {
    // Inicializar Categorias
    final categoriasRef = _firestore.collection('categorias');
    final categoriasSnapshot = await categoriasRef.get();

    if (categoriasSnapshot.docs.isEmpty) {
      await categoriasRef.add({
        "nome": "Tradicionais",
        "descricao": "Pizzas",
        "imagem": "lib/images/categorias/tradicionais.png",
        "ordem": 1
      });

      await categoriasRef.add({
        "nome": "Especiais",
        "descricao": "Exóticos",
        "imagem": "lib/images/categorias/especiais.png",
        "ordem": 2
      });

      await categoriasRef.add({
        "nome": "Bebidas",
        "descricao": "Líquidos",
        "imagem": "lib/images/categorias/bebidas.png",
        "ordem": 3
      });

      await categoriasRef.add({
        "nome": "Sobremesas",
        "descricao": "Doces e afins",
        "imagem": "lib/images/categorias/sobremesas.png",
        "ordem": 4
      });

      await categoriasRef.add({
        "nome": "Entradas",
        "descricao": "Abrir o apetite",
        "imagem": "lib/images/categorias/entradas.png",
        "ordem": 5
      });

      await categoriasRef.add({
        "nome": "Massas",
        "descricao": "Os mais saborosos",
        "imagem": "lib/images/categorias//massas.png",
        "ordem": 6
      });

      await categoriasRef.add({
        "nome": "Saladas",
        "descricao": "Leveza",
        "imagem": "lib/images/categorias/saladas.png",
        "ordem": 7
      });

      await categoriasRef.add({
        "nome": "Promoções",
        "descricao": "Os mais em conta",
        "imagem": "lib/images/categorias/promocoes.png",
        "ordem": 8
      });
    }

    //------------------------------------------
    // Inicializar Itens do Cardápio
    //------------------------------------------
    final itensRef = _firestore.collection('itens_cardapio');
    final itensSnapshot = await itensRef.get();

    if (itensSnapshot.docs.isEmpty) {
      //----------------------
      //Pizzas
      //----------------------

      //4 Queijos
      await itensRef.add({
        "nome": "4 Queijos",
        "descricao": "Gorgonzola, parmesão, mussarela",
        "preco": 40.00,
        "imagem": "lib/images/pizzas/4queijos.png",
        "ativo": true,
        "categoria": "tradicionais"
      });

      //Atum
      await itensRef.add({
        "nome": "Atum",
        "descricao": "Pizza de atum",
        "preco": 45.00,
        "imagem": "lib/images/pizzas/atum.png",
        "ativo": true,
        "categoria": "tradicionais"
      });

      //Frango c/ catupiry
      await itensRef.add({
        "nome": "Frango c/ catupiry",
        "descricao": "Frango desfiado, requeijão Catupiry",
        "preco": 40.00,
        "imagem": "lib/images/pizzas/Frango_Catupiry.png",
        "ativo": true,
        "categoria": "tradicionais"
      });

      //Havaiana
      await itensRef.add({
        "nome": "Havaiana",
        "descricao": "Abacaxi, presunto",
        "preco": 45.00,
        "imagem": "lib/images/pizzas/havaiana.png",
        "ativo": true,
        "categoria": "tradicionais"
      });

      //Marguerita
      await itensRef.add({
        "nome": "Marguerita",
        "descricao": "Oregano, manjericão, mussarela, tomate",
        "preco": 68.00,
        "imagem": "lib/images/pizzas/marguerita.png",
        "ativo": true,
        "categoria": "tradicionais"
      });

      //===========================================================
      //                          Especiais                       =
      //===========================================================

      //Caranguejo c/ amendoim
      await itensRef.add({
        "nome": "Caranguejo c/ amendoim",
        "descricao":
            "Caranguejo assado com pedaços de amendoim torrado e salsinha",
        "preco": 30.00,
        "imagem": "lib/images/especiais/caranguejo_amendoim.png",
        "ativo": true,
        "categoria": "especiais"
      });

      //Carbonara
      await itensRef.add({
        "nome": "Carbonara",
        "descricao": "Macarrão com bacon e gema",
        "preco": 30.00,
        "imagem": "lib/images/especiais/carbonara.png",
        "ativo": true,
        "categoria": "especiais"
      });

      //Lagosta assada
      await itensRef.add({
        "nome": "Lagosta",
        "descricao": "Lagosta assada, cebolinha, salsinha e manteiga",
        "preco": 30.00,
        "imagem": "lib/images/especiais/lagosta.png",
        "ativo": true,
        "categoria": "especiais"
      });

      //Picanha
      await itensRef.add({
        "nome": "Picanha grelhada",
        "descricao": "Picanha grelhada, limão",
        "preco": 70.00,
        "imagem": "lib/images/especiais/picanha.png",
        "ativo": true,
        "categoria": "especiais"
      });

      //Risoto de camarao
      await itensRef.add({
        "nome": "Risoto de camarão",
        "descricao":
            "Arroz, camarão, cebolinha, creme de leite, leite, salsinha",
        "preco": 30.00,
        "imagem": "lib/images/especiais/risoto_camarao.png",
        "ativo": true,
        "categoria": "especiais"
      });

      //===========================================================
      //                         Bebidas                          =
      //===========================================================

      //Abacaxi c/ hortela
      await itensRef.add({
        "nome": "suco de abacaxi c/ hortelã",
        "descricao": "Abacaxi e hortelã",
        "preco": 25.00,
        "imagem": "lib/images/bebidas/abacaxi_hortela.png",
        "ativo": true,
        "categoria": "bebidas"
      });

      //Agua
      await itensRef.add({
        "nome": "Água",
        "descricao": "Água mineral",
        "preco": 5.00,
        "imagem": "lib/images/bebidas/agua.png",
        "ativo": true,
        "categoria": "bebidas"
      });

      //Cupuacu
      await itensRef.add({
        "nome": "Suco de cupuaçu",
        "descricao": "Cupuaçu",
        "preco": 25.00,
        "imagem": "lib/images/bebidas/cupuacu.png",
        "ativo": true,
        "categoria": "bebidas"
      });

      //Graviola
      await itensRef.add({
        "nome": "Suco de graviola",
        "descricao": "Graviola",
        "preco": 25.00,
        "imagem": "lib/images/bebidas/graviola.png",
        "ativo": true,
        "categoria": "bebidas"
      });

      //Laranja
      await itensRef.add({
        "nome": "Suco de laranja",
        "descricao": "Laranja",
        "preco": 25.00,
        "imagem": "lib/images/bebidas/laranja.png",
        "ativo": true,
        "categoria": "bebidas"
      });

      //===========================================================
      //                       Sobremessas                        =
      //===========================================================

      //Banana Split
      await itensRef.add({
        "nome": "Banana Split",
        "descricao": "Duas bananas acompanhadas de 3 bolas",
        "preco": 30.00,
        "imagem": "lib/images/sobremesas/banana_split.png",
        "ativo": true,
        "categoria": "sobremesas"
      });

      //churros de chocolate
      await itensRef.add({
        "nome": "Churros de chocolate",
        "descricao": "Churros de chocolate",
        "preco": 30.00,
        "imagem": "lib/images/sobremesas/churros_chocolate.png",
        "ativo": true,
        "categoria": "sobremesas"
      });

      //Churros de doce de leite
      await itensRef.add({
        "nome": "Churros de doce de leite",
        "descricao": "Churros de doce de leite",
        "preco": 30.00,
        "imagem": "lib/images/sobremesas/churros_leite.png",
        "ativo": true,
        "categoria": "sobremesas"
      });

      //Petit Gateau
      await itensRef.add({
        "nome": "Petit Gateau",
        "descricao":
            "Um bolo de chocolate recheado de chocolate, acompanhado com sorvete",
        "preco": 30.00,
        "imagem": "lib/images/sobremesas/petit_gateau.png",
        "ativo": true,
        "categoria": "sobremesas"
      });

      //sorvete de baunilha
      await itensRef.add({
        "nome": "Sorvete de baunilha",
        "descricao": "Sorvete de baunilha",
        "preco": 30.00,
        "imagem": "lib/images/sobremesas/sorvete_baunilha.png",
        "ativo": true,
        "categoria": "sobremesas"
      });

      //===========================================================
      //                         Entradas                         =
      //===========================================================

      //Batata Frita
      await itensRef.add({
        "nome": "Batata Frita",
        "descricao": "Batata Frita",
        "preco": 30.00,
        "imagem": "lib/images/entrada/batata_frita.png",
        "ativo": true,
        "categoria": "entradas"
      });

      //Hamburguinhos
      await itensRef.add({
        "nome": "Hamburguinhos",
        "descricao": "Hamburguers, mas pequenos",
        "preco": 25.00,
        "imagem": "lib/images/entrada/hamburguinhos.png",
        "ativo": true,
        "categoria": "entradas"
      });

      //===========================================================
      //                         Massas                           =
      //===========================================================

      //Espaguete
      await itensRef.add({
        "nome": "Espaguete",
        "descricao":
            "espaguete, molho de tomate ou molho branco. Acompanha queijo ralado",
        "preco": 45.00,
        "imagem": "lib/images/massas/espaguete.png",
        "ativo": true,
        "categoria": "massas"
      });

      //Lasanha vegetariana
      await itensRef.add({
        "nome": "Lasanja vegetariana",
        "descricao": "Berinjela, queijo, molho de tomate, salsinha",
        "preco": 30.00,
        "imagem": "lib/images/massas/lasanha_berinjela.png",
        "ativo": true,
        "categoria": "massas"
      });

      //Lasanha
      await itensRef.add({
        "nome": "Lasanha",
        "descricao":
            "Presunto, carne moída, queijo, molho de tomate, cebolinha, salsinha",
        "preco": 30.00,
        "imagem": "lib/images/massas/lasanha.png",
        "ativo": true,
        "categoria": "massas"
      });

      //Macarrão alho-e-óleo
      await itensRef.add({
        "nome": "Macarrão alho e óleo",
        "descricao": "Macarrão, alho, azeite, manjericão, oregano",
        "preco": 25.00,
        "imagem": "lib/images/massas/macarrao_alho_oleo.png",
        "ativo": true,
        "categoria": "massas"
      });

      //===========================================================
      //                         Saladas                          =
      //===========================================================

      //Salada Tropical
      await itensRef.add({
        "nome": "Salada Tropical",
        "descricao": "salada tropical",
        "preco": 35.00,
        "imagem": "lib/images/saladas/salada_tropical.png",
        "ativo": true,
        "categoria": "saladas"
      });

      //Salada Caesar
      await itensRef.add({
        "nome": "Salada Caesar",
        "descricao": "Salada Caesar, torradinhas e queijo parmesão",
        "preco": 30.00,
        "imagem": "lib/images/saladas/salada_caesar.png",
        "ativo": true,
        "categoria": "saladas"
      });

      //Salada de fruta
      await itensRef.add({
        "nome": "Salada de fruta",
        "descricao": "Maçã, manga, kiwi, limão, pera, morango",
        "preco": 30.00,
        "imagem": "lib/images/saladas/salada_de_fruta.png",
        "ativo": true,
        "categoria": "saladas"
      });

      //Salada simples
      await itensRef.add({
        "nome": "Salada simples",
        "descricao": "Alface, tomate, cenoura, cebola roxa",
        "preco": 30.00,
        "imagem": "lib/images/saladas/salada_simples.png",
        "ativo": true,
        "categoria": "saladas"
      });

      //===========================================================
      //                         Promocoes                        =
      //===========================================================

      //Combo 2 Pizzas Tradicionais
      await itensRef.add({
        "nome": "Combo 2 Pizzas Tradicionais",
        "descricao": "Pizzas tamanho grande",
        "preco": 105.00,
        "imagem": "lib/images/promocoes/combo_pizzas.png",
        "ativo": true,
        "categoria": "promocoes"
      });

      //Casquinha em dobro
      await itensRef.add({
        "nome": "Casquinha em dobro",
        "descricao": "Pague uma casquinha, leve duas",
        "preco": 5.50,
        "imagem": "lib/images/promocoes/casquinha_dobro.png",
        "ativo": true,
        "categoria": "promocoes"
      });

      //===========================================================
    }
  }
}
