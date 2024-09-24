class Produtos {
  //atributos
  final String nome;
  final String descricao;
  final double valor;
  final String imagem;
  final String categoria;

  Produtos(this.nome, this.descricao, this.valor, this.imagem, this.categoria);

  static List<Produtos> gerarProdutos() {
    List<Produtos> lista = [];

    //===========================================================
    //                        Pizzas                            =
    //===========================================================

    //4 Queijos
    lista.add(Produtos(
      "4 Queijos",
      "Gorgonzola, parmesão, mussarela",
      40.00,
      "lib/images/4queijos.png",
      "Tradicionais"
    ));

    //Atum
    lista.add(Produtos(
      "atum",
      "Piza de atum",
      45.00,
      "lib/images/pizzas/atum.png",
      "Tradicionais",
    ));

    //Frango c/ catupiry
    lista.add(Produtos(
      "Frango c/ catupiry",
      "Frango desfiado, requeijão Catupiry",
      40.00,
      "lib/images/pizzas/Frango_Catupiry.png",
      "Tradicionais",
    ));

    //Havaiana
    lista.add(Produtos(
      "Havaiana",
      "Abacai, presunto",
      45.00,
      "login/lib/images/pizzas/havaiana.png",
      "Tradicionais"
    ));

    //Marguerita
    lista.add(Produtos(
      "Marguerita",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec accumsan laoreet mauris. Nunc maximus nulla at velit pellentesque auctor. Donec non sollicitudin odio. Morbi iaculis vehicula nibh, non lobortis orci tristique in.",
      68.00,
      "lib/images/pizzas/marguerita.png",
      "Tradicionais",
    ));

    //Mussarela
    lista.add(Produtos(
      "Mussarela",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec accumsan laoreet mauris. Nunc maximus nulla at velit pellentesque auctor. Donec non sollicitudin odio. Morbi iaculis vehicula nibh, non lobortis orci tristique in.",
      55.00,
      "lib/images/img1.png",
      "Tradicionais",
    ));

    lista.add(Produtos(
      "Prtuguesa",
      "ervilha, ovo, brocolis",
      45.00,
      "lib/images/pizzas/portuguesa.png",
      "Tradicionais"
    ));

    //===========================================================
    //                          Especiais                       =
    //===========================================================
    
    lista.add(Produtos(
      "Abacaxi",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec accumsan laoreet mauris. Nunc maximus nulla at velit pellentesque auctor. Donec non sollicitudin odio. Morbi iaculis vehicula nibh, non lobortis orci tristique in.",
      55.00,
      "lib/images/img1.png",
      "Especiais",
    ));

    //Caranguejo c/ amendoim
    lista.add(Produtos(
      "Caranguejo c/ amendoim", 
      "Caranguejo assado com pedaços de amendoim torrado e salsinha", 
      30.00, 
      "lib/images/especiais/caranguejo_amendoim.png", 
      "Especiais")
    );
    
    //Carbonara
    lista.add(Produtos(
      "Carbonara", 
      "Macarrão com bacon e gema", 
      30.00, 
      "lib/images/especiais/carbonara.png", 
      "Especiais")
    );

    //Lagosta assada
    lista.add(Produtos(
      "Lagosta", 
      "Lagosta assada, cebolinha, salsinha e manteiga", 
      30.00, 
      "lib/images/especiais/lagosta.png", 
      "Especiais")
    );

    //Picanha
    lista.add(Produtos(
      "Picanha grelhada", 
      "Picanha grelhada, limão, ", 
      70.00, 
      "lib/images/especiais/picanha.png", 
      "Especiais")
    );

    //risoto_camarao
    lista.add(Produtos(
      "Risoto de camarão", 
      "Arroz, camarão, cebolinha, creme de leite, leite, salsinha", 
      30.00, 
      "lib/images/especiais", 
      "Especiais")
    );

    //Nome do produto
    lista.add(Produtos(
      "Salmão grelhado", 
      "Filé de salmão grelhado, pimenta, oregano", 
      30.00, 
      "lib/images/especiais/salmao_grelhado.png", 
      "Especiais")
    );

    //===========================================================
    //                         Bebidas                          =
    //===========================================================
      
    //Abacaxi c/ hortela
    lista.add(Produtos(
      "suco de abacaxi c/ hortelã",
      "Abacaxi e hortelã",
      25.00,
      "lib/images/bebidas/abacaxi_hortela.png",
      "Bebidas"
    ));

    //Agua
    lista.add(Produtos(
      "Água",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec accumsan laoreet mauris. Nunc maximus nulla at velit pellentesque auctor. Donec non sollicitudin odio. Morbi iaculis vehicula nibh, non lobortis orci tristique in.",
      5.00,
      "lib/images/img1.png",
      "Bebidas",
    ));

    //Cupuacu
    lista.add(Produtos(
      "Suco de cupuaçu",
      "Cupuaçu",
      25.00,
      "lib/images/bebidas/cupuacu.png",
      "Bebidas"

    ));

    //Graviola
    lista.add(Produtos(
      "Suco de graviola",
      "Graviola",
      25.00,
      "lib/images/bebidas/graviola.png",
      "Bebidas"
    ));

    //Laranja
    lista.add(Produtos(
      "Suco de laranja",
      "Laranja",
      25.00,
      "lib/images/bebidas/laranja.png",
      "Bebidas"
    ));
    
    //Limao
    lista.add(Produtos(
      "Suco de limão",
      "Limão",
      25.00,
      "lib/images/bebidas/lomao.png",
      "Bebidas"
    ));
    
    //Morango
    lista.add(Produtos(
      "Suco de morango",
      "Morango", 25.00,
      "lib/images/bebidas/morango.png",
      "Bebidas"
    ));
    
    //Uva
    lista.add(Produtos(
      "Suco de uva",
      "Uva",
      25.00,
      "lib/images/bebidas/uva.png",
      "Bebidas"
    ));
    
    //===========================================================
    //                       Sobremessas                        =
    //===========================================================

    //Banana Split
    lista.add(Produtos(
      "Banana Split", 
      "Duas bananas acompanhadas de 3 bolas", 
      30.00, 
      "lib/images/sobremesas/banana_split.png", 
      "Sobremesas")
    );

    //churros de chocolate
    lista.add(Produtos(
      "Churros de chocolate", 
      "Churros de chocolate", 
      30.00, 
      "lib/images/sobremesas", 
      "Sobremesas")
    );
    
    //Churros de doce de leite
    lista.add(Produtos(
      "Churros de doce de leite", 
      "Churros de doce de leite", 
      30.00, 
      "lib/images/sobremesas", 
      "Sobremesas")
    );

    //Petit Gateau
    lista.add(Produtos(
      "Petit Gateau", 
      "Um bolo de chocolate recheado de chocolate, acompanhado com sorvete", 
      30.00, 
      "lib/images/sobremesas", 
      "Sobremesas")
    );

    //sorvete de baunilha
    lista.add(Produtos(
      "Sorvete de baunilha", 
      "Sorvete de baunilha", 
      30.00, 
      "lib/images/sobremesas/sorvete_baunilha.png", 
      "Sobremesas")
    );

    //sorvete de chocolate
    lista.add(Produtos(
      "Sorvete de chocolate", 
      "Sorvete de chocolate", 
      30.00, 
      "lib/images/sobremesas/sorvete_chocolate.png", 
      "Sobremesas")
    );

    //===========================================================
    //                         Massas                           =
    //===========================================================

    lista.add(Produtos(
      "Abacaxi",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec accumsan laoreet mauris. Nunc maximus nulla at velit pellentesque auctor. Donec non sollicitudin odio. Morbi iaculis vehicula nibh, non lobortis orci tristique in.",
      55.00,
      "lib/images/img1.png",
      "Massas",
    ));

    //Lasanha vegetariana
    lista.add(Produtos(
      "Lasanja vegetariana", 
      "Berinjela, queijo, molho de tomate, salsinha", 
      30.00, 
      "lib/images/lasanha_berinjela.png", 
      "Massas")
    );
    
    //Lasanha
    lista.add(Produtos(
      "Lasanha", 
      "Presunto, carne moída, queijo, molho de tomate, cebolinha, salsinha", 
      30.00, 
      "lib/images/massas/lasanha.png", 
      "Massas")
    );

    //Macarrão alho-e-óleo
    lista.add(Produtos(
      "Macarrão alho e óleo", 
      "Macarrão, alho, azeite, manjericão, oregano", 
      30.00, 
      "lib/images/massas/macarrao_alho_oleo.png", 
      "Massas")
    );

    //Massa fresaca
    lista.add(Produtos(
      "Massa fresca", 
      "Macarrão, molho de tomate ou branco", 
      30.00, 
      "lib/images/massas/massa_fresca.png", 
      "Massas")
    );

    //Nhoque
    lista.add(Produtos(
      "Nhoque", 
      "Nhoque, manjericão, molho de tomate ou branco", 
      30.00, 
      "lib/images/massas/nhoque.png", 
      "Massas")
    );

    //Pastel de salmao
    lista.add(Produtos(
      "Pastel de salmão com creamcheese", 
      "Pastel, salmão, creamcheese", 
      30.00, 
      "lib/images/massas/pastel_salmao.png", 
      "Massas")
    );

    //torta_frango
    lista.add(Produtos(
      "Torta de frango", 
      "Frango, ervilha, requeijão", 
      30.00, 
      "lib/images/massas/torta_frango", 
      "Massas")
    );

    //===========================================================
    //                         Saladas                          =
    //===========================================================

    lista.add(Produtos(
      "Abacaxi",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec accumsan laoreet mauris. Nunc maximus nulla at velit pellentesque auctor. Donec non sollicitudin odio. Morbi iaculis vehicula nibh, non lobortis orci tristique in.",
      55.00,
      "lib/images/img1.png",
      "Saladas",
    ));

    //Salada Caesar
    lista.add(Produtos(
      "Salada Caesar", 
      "Salada Caesar, torradinhas e queijo parmesão", 
      30.00, 
      "lib/images/saladas/salada_caesar.png", 
      "Saladas")
    );
    
    //Salada de fruta
    lista.add(Produtos(
      "Salada de fruta", 
      "Maçã, manga, kiwi, limão, pera, morango, ", 
      30.00, 
      "lib/images/saladas/salada_de_fruta.png", 
      "Saladas")
    );

    //Nome do produto
    lista.add(Produtos(
      "Salada simples", 
      "Alface, tomate, cenoura, cebola roxa, ", 
      30.00, 
      "lib/images/saladas/salada_simples/", 
      "Saladas")
    );

    //===========================================================
    //                         Promocoes                        =
    //===========================================================

    lista.add(Produtos(
      "Abacaxi",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec accumsan laoreet mauris. Nunc maximus nulla at velit pellentesque auctor. Donec non sollicitudin odio. Morbi iaculis vehicula nibh, non lobortis orci tristique in.",
      55.00,
      "lib/images/img1.png",
      "Promoções",
    ));

    //Nome do produto
    lista.add(Produtos(
      "nome", 
      "desc", 
      30.00, 
      "lib/images/", 
      "Promoções")
    );
    
    //Nome do produto
    lista.add(Produtos(
      "nome", 
      "desc", 
      30.00, 
      "lib/images/", 
      "Promoções")
    );

    //Nome do produto
    lista.add(Produtos(
      "nome", 
      "desc", 
      30.00, 
      "lib/images/", 
      "Promoções")
    );

    //Nome do produto
    lista.add(Produtos(
      "nome", 
      "desc", 
      30.00, 
      "lib/images/", 
      "Promoções")
    );

    //Nome do produto
    lista.add(Produtos(
      "nome", 
      "desc", 
      30.00, 
      "lib/images/", 
      "Promoções")
    );

    //Nome do produto
    lista.add(Produtos(
      "nome", 
      "desc", 
      30.00, 
      "lib/images/", 
      "Promoções")
    );

    //Nome do produto
    lista.add(Produtos(
      "nome", 
      "desc", 
      30.00, 
      "lib/images/", 
      "Promoções")
    );

    //===========================================================
    return lista;
  }
}