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
    lista.add(Produtos("4 Queijos", "Gorgonzola, parmesão, mussarela", 40.00,
        "lib/images/pizzas/4queijos.png", "Tradicionais"));

    //Atum
    lista.add(Produtos(
      "Atum",
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
    lista.add(Produtos("Havaiana", "Abacai, presunto", 45.00,
        "lib/images/pizzas/havaiana.png", "Tradicionais"));

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
      "lib/images/pizzas/mussarela.png",
      "Tradicionais",
    ));

    lista.add(Produtos("Portuguesa", "ervilha, ovo, brocolis", 45.00,
        "lib/images/pizzas/portuguesa.png", "Tradicionais"));

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

    //Nome do produto
    lista.add(Produtos("nome", "desc", 30.00, "lib/images/", "Especiais"));

    //Nome do produto
    lista.add(Produtos("nome", "desc", 30.00, "lib/images/", "Especiais"));

    //Nome do produto
    lista.add(Produtos("nome", "desc", 30.00, "lib/images/", "Especiais"));

    //Nome do produto
    lista.add(Produtos("nome", "desc", 30.00, "lib/images/", "Especiais"));

    //Nome do produto
    lista.add(Produtos("nome", "desc", 30.00, "lib/images/", "Especiais"));

    //Nome do produto
    lista.add(Produtos("nome", "desc", 30.00, "lib/images/", "Especiais"));

    //Nome do produto
    lista.add(Produtos("nome", "desc", 30.00, "lib/images/", "Especiais"));

    //===========================================================
    //                         Bebidas                          =
    //===========================================================

    //Abacaxi c/ hortela
    lista.add(Produtos("suco de abacaxi c/ hortelã", "Abacaxi e hortelã", 25.00,
        "lib/images/bebidas/abacaxi_hortela.png", "Bebidas"));

    //Agua
    lista.add(Produtos(
      "Água",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec accumsan laoreet mauris. Nunc maximus nulla at velit pellentesque auctor. Donec non sollicitudin odio. Morbi iaculis vehicula nibh, non lobortis orci tristique in.",
      5.00,
      "lib/images/img1.png",
      "Bebidas",
    ));

    //Cupuacu
    lista.add(Produtos("Suco de cupuaçu", "Cupuaçu", 25.00,
        "lib/images/bebidas/cupuacu.png", "Bebidas"));

    //Graviola
    lista.add(Produtos("Suco de graviola", "Graviola", 25.00,
        "lib/images/bebidas/graviola.png", "Bebidas"));

    //Laranja
    lista.add(Produtos("Suco de laranja", "Laranja", 25.00,
        "lib/images/bebidas/laranja.png", "Bebidas"));

    //Limao
    lista.add(Produtos("Suco de limão", "Limão", 25.00,
        "lib/images/bebidas/limao.png", "Bebidas"));

    //Morango
    lista.add(Produtos("Suco de morango", "Morango", 25.00,
        "lib/images/bebidas/morango.png", "Bebidas"));

    //Uva
    lista.add(Produtos(
        "Suco de uva", "Uva", 25.00, "lib/images/bebidas/uva.png", "Bebidas"));

    //===========================================================
    //                       Sobremessas                        =
    //===========================================================

    lista.add(Produtos(
      "Pudim",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec accumsan laoreet mauris. Nunc maximus nulla at velit pellentesque auctor. Donec non sollicitudin odio. Morbi iaculis vehicula nibh, non lobortis orci tristique in.",
      15.00,
      "lib/images/img1.png",
      "Sobremesas",
    ));

    //Nome do produto
    lista.add(Produtos("nome", "desc", 30.00, "lib/images/", "Sobremesas"));

    //Nome do produto
    lista.add(Produtos("nome", "desc", 30.00, "lib/images/", "Sobremesas"));

    //Nome do produto
    lista.add(Produtos("nome", "desc", 30.00, "lib/images/", "Sobremesas"));

    //Nome do produto
    lista.add(Produtos("nome", "desc", 30.00, "lib/images/", "Sobremesas"));

    //Nome do produto
    lista.add(Produtos("nome", "desc", 30.00, "lib/images/", "Sobremesas"));

    //Nome do produto
    lista.add(Produtos("nome", "desc", 30.00, "lib/images/", "Sobremesas"));

    //Nome do produto
    lista.add(Produtos("nome", "desc", 30.00, "lib/images/", "Sobremesas"));

    //===========================================================
    //                         Entradas                           =
    //===========================================================

    lista.add(Produtos(
      "Batata Frita",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec accumsan laoreet mauris. Nunc maximus nulla at velit pellentesque auctor. Donec non sollicitudin odio. Morbi iaculis vehicula nibh, non lobortis orci tristique in.",
      30.00,
      "lib/images/img1.png",
      "Entradas",
    ));

    //Nome do produto
    lista.add(Produtos("nome", "desc", 30.00, "lib/images/", "Entradas"));

    //Nome do produto
    lista.add(Produtos("nome", "desc", 30.00, "lib/images/", "Entradas"));

    //Nome do produto
    lista.add(Produtos("nome", "desc", 30.00, "lib/images/", "Entradas"));

    //Nome do produto
    lista.add(Produtos("nome", "desc", 30.00, "lib/images/", "Entradas"));

    //Nome do produto
    lista.add(Produtos("nome", "desc", 30.00, "lib/images/", "Entradas"));

    //Nome do produto
    lista.add(Produtos("nome", "desc", 30.00, "lib/images/", "Entradas"));

    //Nome do produto
    lista.add(Produtos("nome", "desc", 30.00, "lib/images/", "Entradas"));

    //===========================================================
    //                         Massas                           =
    //===========================================================

    lista.add(Produtos(
      "Espaguete",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec accumsan laoreet mauris. Nunc maximus nulla at velit pellentesque auctor. Donec non sollicitudin odio. Morbi iaculis vehicula nibh, non lobortis orci tristique in.",
      45.00,
      "lib/images/img1.png",
      "Massas",
    ));

    //Nome do produto
    lista.add(Produtos("nome", "desc", 30.00, "lib/images/", "Massas"));

    //Nome do produto
    lista.add(Produtos("nome", "desc", 30.00, "lib/images/", "Massas"));

    //Nome do produto
    lista.add(Produtos("nome", "desc", 30.00, "lib/images/", "Massas"));

    //Nome do produto
    lista.add(Produtos("nome", "desc", 30.00, "lib/images/", "Massas"));

    //Nome do produto
    lista.add(Produtos("nome", "desc", 30.00, "lib/images/", "Massas"));

    //Nome do produto
    lista.add(Produtos("nome", "desc", 30.00, "lib/images/", "Massas"));

    //Nome do produto
    lista.add(Produtos("nome", "desc", 30.00, "lib/images/", "Massas"));

    //===========================================================
    //                         Saladas                          =
    //===========================================================

    lista.add(Produtos(
      "Salada Tropical",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec accumsan laoreet mauris. Nunc maximus nulla at velit pellentesque auctor. Donec non sollicitudin odio. Morbi iaculis vehicula nibh, non lobortis orci tristique in.",
      35.00,
      "lib/images/img1.png",
      "Saladas",
    ));

    //Nome do produto
    lista.add(Produtos("nome", "desc", 30.00, "lib/images/", "Saladas"));

    //Nome do produto
    lista.add(Produtos("nome", "desc", 30.00, "lib/images/", "Saladas"));

    //Nome do produto
    lista.add(Produtos("nome", "desc", 30.00, "lib/images/", "Saladas"));

    //Nome do produto
    lista.add(Produtos("nome", "desc", 30.00, "lib/images/", "Saladas"));

    //Nome do produto
    lista.add(Produtos("nome", "desc", 30.00, "lib/images/", "Saladas"));

    //Nome do produto
    lista.add(Produtos("nome", "desc", 30.00, "lib/images/", "Saladas"));

    //Nome do produto
    lista.add(Produtos("nome", "desc", 30.00, "lib/images/", "Saladas"));

    //===========================================================
    //                         Promocoes                        =
    //===========================================================

    lista.add(Produtos(
      "Combo 2 Pizzas Tradicionais",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec accumsan laoreet mauris. Nunc maximus nulla at velit pellentesque auctor. Donec non sollicitudin odio. Morbi iaculis vehicula nibh, non lobortis orci tristique in.",
      105.00,
      "lib/images/img1.png",
      "Promoções",
    ));

    //Nome do produto
    lista.add(Produtos("nome", "desc", 30.00, "lib/images/", "Promoções"));

    //Nome do produto
    lista.add(Produtos("nome", "desc", 30.00, "lib/images/", "Promoções"));

    //Nome do produto
    lista.add(Produtos("nome", "desc", 30.00, "lib/images/", "Promoções"));

    //Nome do produto
    lista.add(Produtos("nome", "desc", 30.00, "lib/images/", "Promoções"));

    //Nome do produto
    lista.add(Produtos("nome", "desc", 30.00, "lib/images/", "Promoções"));

    //Nome do produto
    lista.add(Produtos("nome", "desc", 30.00, "lib/images/", "Promoções"));

    //Nome do produto
    lista.add(Produtos("nome", "desc", 30.00, "lib/images/", "Promoções"));

    //===========================================================
    return lista;
  }
}
