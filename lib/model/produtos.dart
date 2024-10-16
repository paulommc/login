class Produtos {
  //atributos
  final String nome;
  final String descricao;
  final double valor;
  final String imagem;
  final String categoria;
  final int quantidade;

  Produtos(this.nome, this.descricao, this.valor, this.imagem, this.categoria,
      this.quantidade);

  static List<Produtos> gerarProdutos() {
    List<Produtos> lista = [];

    //===========================================================
    //                        Pizzas                            =
    //===========================================================

    //4 Queijos

    lista.add(Produtos("4 Queijos", "Gorgonzola, parmesão, mussarela", 40.00,
        "lib/images/pizzas/4queijos.png", "Tradicionais", 0));

    //Atum
    lista.add(Produtos("Atum", "Piza de atum", 45.00,
        "lib/images/pizzas/atum.png", "Tradicionais", 0));

    //Frango c/ catupiry
    lista.add(Produtos(
        "Frango c/ catupiry",
        "Frango desfiado, requeijão Catupiry",
        40.00,
        "lib/images/pizzas/Frango_Catupiry.png",
        "Tradicionais",
        0));

    //Havaiana
    lista.add(Produtos("Havaiana", "Abacai, presunto", 45.00,
        "lib/images/pizzas/havaiana.png", "Tradicionais", 0));

    //Marguerita
    lista.add(Produtos("Marguerita", "Oregano, manjericão, mussarela, tomate",
        68.00, "lib/images/pizzas/marguerita.png", "Tradicionais", 0));

    //Mussarela
    lista.add(Produtos("Mussarela", "mussarela, tomate", 55.00,
        "lib/images/pizzas/mussarela.png", "Tradicionais", 0));

    lista.add(Produtos("Portuguesa", "ervilha, ovo, brocolis", 45.00,
        "lib/images/pizzas/portuguesa.png", "Tradicionais", 0));

    //===========================================================
    //                          Especiais                       =
    //===========================================================

    lista.add(Produtos("Abacaxi grelhado", "Abacaxi", 55.00,
        "lib/images/img1.png", "Especiais", 0));

    //Caranguejo c/ amendoim
    lista.add(Produtos(
        "Caranguejo c/ amendoim",
        "Caranguejo assado com pedaços de amendoim torrado e salsinha",
        30.00,
        "lib/images/especiais/caranguejo_amendoim.png",
        "Especiais",
        0));

    //Carbonara
    lista.add(Produtos("Carbonara", "Macarrão com bacon e gema", 30.00,
        "lib/images/especiais/carbonara.png", "Especiais", 0));

    //Lagosta assada
    lista.add(Produtos(
        "Lagosta",
        "Lagosta assada, cebolinha, salsinha e manteiga",
        30.00,
        "lib/images/especiais/lagosta.png",
        "Especiais",
        0));

    //Picanha
    lista.add(Produtos("Picanha grelhada", "Picanha grelhada, limão, ", 70.00,
        "lib/images/especiais/picanha.png", "Especiais", 0));

    //Risoto de camarao
    lista.add(Produtos(
        "Risoto de camarão",
        "Arroz, camarão, cebolinha, creme de leite, leite, salsinha",
        30.00,
        "lib/images/especiais",
        "Especiais",
        0));

    //Salmao grelhado
    lista.add(Produtos(
        "Salmão grelhado",
        "Filé de salmão grelhado, pimenta, oregano",
        30.00,
        "lib/images/especiais/salmao_grelhado.png",
        "Especiais",
        0));

    //===========================================================
    //                         Bebidas                          =
    //===========================================================

    //Abacaxi c/ hortela
    lista.add(Produtos("suco de abacaxi c/ hortelã", "Abacaxi e hortelã", 25.00,
        "lib/images/bebidas/abacaxi_hortela.png", "Bebidas", 0));

    //Agua
    lista.add(Produtos(
        "Água", "Água mineral", 5.00, "lib/images/img1.png", "Bebidas", 0));

    //Cupuacu
    lista.add(Produtos("Suco de cupuaçu", "Cupuaçu", 25.00,
        "lib/images/bebidas/cupuacu.png", "Bebidas", 0));

    //Graviola
    lista.add(Produtos("Suco de graviola", "Graviola", 25.00,
        "lib/images/bebidas/graviola.png", "Bebidas", 0));

    //Laranja
    lista.add(Produtos("Suco de laranja", "Laranja", 25.00,
        "lib/images/bebidas/laranja.png", "Bebidas", 0));

    //Limao
    lista.add(Produtos("Suco de limão", "Limão", 25.00,
        "lib/images/bebidas/limao.png", "Bebidas", 0));

    //Morango
    lista.add(Produtos("Suco de morango", "Morango", 25.00,
        "lib/images/bebidas/morango.png", "Bebidas", 0));

    //Uva
    lista.add(Produtos("Suco de uva", "Uva", 25.00,
        "lib/images/bebidas/uva.png", "Bebidas", 0));

    //===========================================================
    //                       Sobremessas                        =
    //===========================================================

    //Banana Split
    lista.add(Produtos("Banana Split", "Duas bananas acompanhadas de 3 bolas",
        30.00, "lib/images/sobremesas/banana_split.png", "Sobremesas", 0));

    //churros de chocolate
    lista.add(Produtos("Churros de chocolate", "Churros de chocolate", 30.00,
        "lib/images/sobremesas", "Sobremesas", 0));

    //Churros de doce de leite
    lista.add(Produtos("Churros de doce de leite", "Churros de doce de leite",
        30.00, "lib/images/sobremesas", "Sobremesas", 0));

    //Petit Gateau
    lista.add(Produtos(
        "Petit Gateau",
        "Um bolo de chocolate recheado de chocolate, acompanhado com sorvete",
        30.00,
        "lib/images/sobremesas",
        "Sobremesas",
        0));

    //sorvete de baunilha
    lista.add(Produtos("Sorvete de baunilha", "Sorvete de baunilha", 30.00,
        "lib/images/sobremesas/sorvete_baunilha.png", "Sobremesas", 0));

    //sorvete de chocolate
    lista.add(Produtos("Sorvete de chocolate", "Sorvete de chocolate", 30.00,
        "lib/images/sobremesas/sorvete_chocolate.png", "Sobremesas", 0));

    //===========================================================
    //                         Entradas                           =
    //===========================================================

    lista.add(Produtos("Batata Frita", "Batata frita", 30.00,
        "lib/images/img1.png", "Entradas", 0));

    //===========================================================
    //                         Massas                           =
    //===========================================================

    lista.add(Produtos(
        "Espaguete",
        "espaguete, molho de tomate ou molho branco. Acompanha queijo ralado",
        45.00,
        "lib/images/img1.png",
        "Massas",
        0));

    //Lasanha vegetariana
    lista.add(Produtos(
        "Lasanja vegetariana",
        "Berinjela, queijo, molho de tomate, salsinha",
        30.00,
        "lib/images/lasanha_berinjela.png",
        "Massas",
        0));

    //Lasanha
    lista.add(Produtos(
        "Lasanha",
        "Presunto, carne moída, queijo, molho de tomate, cebolinha, salsinha",
        30.00,
        "lib/images/massas/lasanha.png",
        "Massas",
        0));

    //Macarrão alho-e-óleo
    lista.add(Produtos(
        "Macarrão alho e óleo",
        "Macarrão, alho, azeite, manjericão, oregano",
        30.00,
        "lib/images/massas/macarrao_alho_oleo.png",
        "Massas",
        0));

    //Massa fresaca
    lista.add(Produtos("Massa fresca", "Macarrão, molho de tomate ou branco",
        30.00, "lib/images/massas/massa_fresca.png", "Massas", 0));

    //Nhoque
    lista.add(Produtos(
        "Nhoque",
        "Nhoque, manjericão, molho de tomate ou branco",
        30.00,
        "lib/images/massas/nhoque.png",
        "Massas",
        0));

    //Pastel de salmao
    lista.add(Produtos(
        "Pastel de salmão com creamcheese",
        "Pastel, salmão, creamcheese",
        30.00,
        "lib/images/massas/pastel_salmao.png",
        "Massas",
        0));

    //torta_frango
    lista.add(Produtos("Torta de frango", "Frango, ervilha, requeijão", 30.00,
        "lib/images/massas/torta_frango.png", "Massas", 0));

    //===========================================================
    //                         Saladas                          =
    //===========================================================

    lista.add(Produtos("Salada Tropical", "salada tropical", 35.00,
        "lib/images/img1.png", "Saladas", 0));

    //Salada Caesar
    lista.add(Produtos(
        "Salada Caesar",
        "Salada Caesar, torradinhas e queijo parmesão",
        30.00,
        "lib/images/saladas/salada_caesar.png",
        "Saladas",
        0));

    //Salada de fruta
    lista.add(Produtos(
        "Salada de fruta",
        "Maçã, manga, kiwi, limão, pera, morango, ",
        30.00,
        "lib/images/saladas/salada_de_fruta.png",
        "Saladas",
        0));

    //Salada simples
    lista.add(Produtos(
        "Salada simples",
        "Alface, tomate, cenoura, cebola roxa, ",
        30.00,
        "lib/images/saladas/salada_simples.png",
        "Saladas",
        0));

    //===========================================================
    //                         Promocoes                        =
    //===========================================================

    lista.add(Produtos("Combo 2 Pizzas Tradicionais", "Pizzas tamanho grande",
        105.00, "lib/images/img1.png", "Promoções", 0));

    //Nome do produto
    lista.add(Produtos("nome", "desc", 30.00, "lib/images/", "Promoções", 0));

    //Nome do produto
    lista.add(Produtos("nome", "desc", 30.00, "lib/images/", "Promoções", 0));

    //Nome do produto
    lista.add(Produtos("nome", "desc", 30.00, "lib/images/", "Promoções", 0));

    //Nome do produto
    lista.add(Produtos("nome", "desc", 30.00, "lib/images/", "Promoções", 0));

    //Nome do produto
    lista.add(Produtos("nome", "desc", 30.00, "lib/images/", "Promoções", 0));

    //Nome do produto
    lista.add(Produtos("nome", "desc", 30.00, "lib/images/", "Promoções", 0));

    //Nome do produto
    lista.add(Produtos("nome", "desc", 30.00, "lib/images/", "Promoções", 0));

    //===========================================================
    return lista;
  }
}
