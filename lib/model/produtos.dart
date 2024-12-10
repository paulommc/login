
class Produto {
  final String nome;
  final String descricao;
  final double valor;
  final String imagem;
  final String categoria;

  Produto({
    required this.nome,
    required this.descricao,
    required this.valor,
    required this.imagem,
    required this.categoria,
  });

  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
      nome: json['nome'] ?? '',
      descricao: json['descricao'] ?? '',
      valor: (json['preco'] ?? 0).toDouble(),
      imagem: json['imagem'] ?? '',
      categoria: json['categoria'] ?? '',
    );
  }
}


/* class Produto {
  final String nome;
  final String descricao;
  final double valor;
  final String imagem;
  final String categoria;

  Produto(this.nome, this.descricao, this.valor, this.imagem, this.categoria);

  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
      json['nome'],
      json['descricao'],
      json['valor'],
      json['imagem'],
      json['categoria'],
    );
  }
} */


//ItensCardapio
/* class Produtos {
  //atributos
  final String nome;
  final String descricao;
  final double valor;
  final String imagem;
  final bool ativo;
  final String categoria;

  Produtos(this.nome, this.descricao, this.valor, this.imagem, this.categoria, this.ativo,
      );

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'nome': nome,
      'descricao': descricao,
      'valor': valor,
      'imagem': imagem,
      'status': ativo,
      'categoria': categoria,
    };
  }

  factory Produtos.fromJson(Map<String, dynamic> json) {
    return Produtos(
      json['nome'],
      json['descricao'],
      json['valor'],
      json['imagem'],
      json['ativo'],
      json['categoria'],
    );
  }

  static List<Produtos> gerarProdutos() {
    List<Produtos> lista = [];

    //===========================================================
    //                        Pizzas                            =
    //===========================================================

    //4 Queijos
    lista.add(Produtos("4 Queijos", "Gorgonzola, parmesão, mussarela", 40.00,
        "lib/images/pizzas/4queijos.png", "Tradicionais", true));

    //Atum
    lista.add(Produtos("Atum", "Pizza de atum", 45.00,
        "lib/images/pizzas/atum.png", "Tradicionais", true));

    //Frango c/ catupiry
    lista.add(Produtos(
        "Frango c/ catupiry",
        "Frango desfiado, requeijão Catupiry",
        40.00,
        "lib/images/pizzas/Frango_Catupiry.png",
        "Tradicionais",
        true));

    //Havaiana
    lista.add(Produtos("Havaiana", "Abacaxi, presunto", 45.00,
        "lib/images/pizzas/havaiana.png", "Tradicionais", true));

    //Marguerita
    lista.add(Produtos("Marguerita", "Oregano, manjericão, mussarela, tomate",
        68.00, "lib/images/pizzas/marguerita.png", "Tradicionais", true));

    //Mussarela
    lista.add(Produtos("Mussarela", "mussarela, tomate", 55.00,
        "lib/images/pizzas/mussarela.png", "Tradicionais", true));

    lista.add(Produtos("Portuguesa", "ervilha, ovo, brocolis", 45.00,
        "lib/images/pizzas/portuguesa.png", "Tradicionais", true));

    //===========================================================
    //                          Especiais                       =
    //===========================================================

    //Caranguejo c/ amendoim
    lista.add(Produtos(
        "Caranguejo c/ amendoim",
        "Caranguejo assado com pedaços de amendoim torrado e salsinha",
        30.00,
        "lib/images/especiais/caranguejo_amendoim.png",
        "Especiais",
        true));

    //Carbonara
    lista.add(Produtos("Carbonara", "Macarrão com bacon e gema", 30.00,
        "lib/images/especiais/carbonara.png", "Especiais", true));

    //Lagosta assada
    lista.add(Produtos(
        "Lagosta",
        "Lagosta assada, cebolinha, salsinha e manteiga",
        30.00,
        "lib/images/especiais/lagosta.png",
        "Especiais",
        true));

    //Picanha
    lista.add(Produtos("Picanha grelhada", "Picanha grelhada, limão, ", 70.00,
        "lib/images/especiais/picanha.png", "Especiais", true));

    //Risoto de camarao
    lista.add(Produtos(
        "Risoto de camarão",
        "Arroz, camarão, cebolinha, creme de leite, leite, salsinha",
        30.00,
        "lib/images/especiais/risoto_camarao.png",
        "Especiais",
        true));

    //Salmao grelhado
    lista.add(Produtos(
        "Salmão grelhado",
        "Filé de salmão grelhado, pimenta, oregano",
        30.00,
        "lib/images/especiais/salmao_grelhado.png",
        "Especiais",
        true));

    //===========================================================
    //                         Bebidas                          =
    //===========================================================

    //Abacaxi c/ hortela
    lista.add(Produtos("suco de abacaxi c/ hortelã", "Abacaxi e hortelã", 25.00,
        "lib/images/bebidas/abacaxi_hortela.png", "Bebidas", true));

    //Agua
    lista.add(Produtos("Água", "Água mineral", 5.00,
        "lib/images/bebidas/agua.png", "Bebidas", true));

    //Cupuacu
    lista.add(Produtos("Suco de cupuaçu", "Cupuaçu", 25.00,
        "lib/images/bebidas/cupuacu.png", "Bebidas", true));

    //Graviola
    lista.add(Produtos("Suco de graviola", "Graviola", 25.00,
        "lib/images/bebidas/graviola.png", "Bebidas", true));

    //Laranja
    lista.add(Produtos("Suco de laranja", "Laranja", 25.00,
        "lib/images/bebidas/laranja.png", "Bebidas", true));

    //Limao
    lista.add(Produtos("Suco de limão", "Limão", 25.00,
        "lib/images/bebidas/limao.png", "Bebidas", true));

    //Morango
    lista.add(Produtos("Suco de morango", "Morango", 25.00,
        "lib/images/bebidas/morango.png", "Bebidas", true));

    //Uva
    lista.add(Produtos("Suco de uva", "Uva", 25.00,
        "lib/images/bebidas/uva.png", "Bebidas", true));

    //===========================================================
    //                       Sobremessas                        =
    //===========================================================

    //Banana Split
    lista.add(Produtos("Banana Split", "Duas bananas acompanhadas de 3 bolas",
        30.00, "lib/images/sobremesas/banana_split.png", "Sobremesas", true));

    //churros de chocolate
    lista.add(Produtos("Churros de chocolate", "Churros de chocolate", 30.00,
        "lib/images/sobremesas/churros_chocolate.png", "Sobremesas", true));

    //Churros de doce de leite
    lista.add(Produtos("Churros de doce de leite", "Churros de doce de leite",
        30.00, "lib/images/sobremesas/churros_leite.png", "Sobremesas", true));

    //Petit Gateau
    lista.add(Produtos(
        "Petit Gateau",
        "Um bolo de chocolate recheado de chocolate, acompanhado com sorvete",
        30.00,
        "lib/images/sobremesas/petit_gateau.png",
        "Sobremesas",
        true));

    //sorvete de baunilha
    lista.add(Produtos("Sorvete de baunilha", "Sorvete de baunilha", 30.00,
        "lib/images/sobremesas/sorvete_baunilha.png", "Sobremesas", true));

    //sorvete de chocolate
    lista.add(Produtos("Sorvete de chocolate", "Sorvete de chocolate", 30.00,
        "lib/images/sobremesas/sorvete_chocolate.png", "Sobremesas", true));

    //===========================================================
    //                         Entradas                           =
    //===========================================================

    lista.add(Produtos("Batata Frita", "Batata frita", 30.00,
        "lib/images/entrada/batata_frita.png", "Entradas", true));

    lista.add(Produtos("Hamburguinhos", "Hamburguers, mas pequenos", 25,
        "lib/images/entrada/hamburguinhos.png", "Entradas", true));

    lista.add(Produtos("Salgadinhos", "salgadinhos para abrir o apetite", 25,
        "lib/images/entrada/salgadinhos.png", "Entradas", true));

    //===========================================================
    //                         Massas                           =
    //===========================================================

    lista.add(Produtos(
        "Espaguete",
        "espaguete, molho de tomate ou molho branco. Acompanha queijo ralado",
        45.00,
        "lib/images/massas/espaguete.png",
        "Massas",
        true));

    //Lasanha vegetariana
    lista.add(Produtos(
        "Lasanja vegetariana",
        "Berinjela, queijo, molho de tomate, salsinha",
        30.00,
        "lib/images/massas/lasanha_berinjela.png",
        "Massas",
        true));

    //Lasanha
    lista.add(Produtos(
        "Lasanha",
        "Presunto, carne moída, queijo, molho de tomate, cebolinha, salsinha",
        30.00,
        "lib/images/massas/lasanha.png",
        "Massas",
        true));

    //Macarrão alho-e-óleo
    lista.add(Produtos(
        "Macarrão alho e óleo",
        "Macarrão, alho, azeite, manjericão, oregano",
        30.00,
        "lib/images/massas/macarrao_alho_oleo.png",
        "Massas",
        true));

    //Massa fresaca
    lista.add(Produtos("Massa fresca", "Macarrão, molho de tomate ou branco",
        30.00, "lib/images/massas/massa_fresca.png", "Massas", true));

    //Nhoque
    lista.add(Produtos(
        "Nhoque",
        "Nhoque, manjericão, molho de tomate ou branco",
        30.00,
        "lib/images/massas/nhoque.png",
        "Massas",
        true));

    //Pastel de salmao
    lista.add(Produtos(
        "Pastel de salmão com creamcheese",
        "Pastel, salmão, creamcheese",
        30.00,
        "lib/images/massas/pastel_salmao.png",
        "Massas",
        true));

    //torta_frango
    lista.add(Produtos("Torta de frango", "Frango, ervilha, requeijão", 30.00,
        "lib/images/massas/torta_frango.png", "Massas", true));

    //===========================================================
    //                         Saladas                          =
    //===========================================================

    lista.add(Produtos("Salada Tropical", "salada tropical", 35.00,
        "lib/images/saladas/salada_tropical.png", "Saladas", true));

    //Salada Caesar
    lista.add(Produtos(
        "Salada Caesar",
        "Salada Caesar, torradinhas e queijo parmesão",
        30.00,
        "lib/images/saladas/salada_caesar.png",
        "Saladas",
        true));

    //Salada de fruta
    lista.add(Produtos(
        "Salada de fruta",
        "Maçã, manga, kiwi, limão, pera, morango ",
        30.00,
        "lib/images/saladas/salada_de_fruta.png",
        "Saladas",
        true));

    //Salada simples
    lista.add(Produtos(
        "Salada simples",
        "Alface, tomate, cenoura, cebola roxa, ",
        30.00,
        "lib/images/saladas/salada_simples.png",
        "Saladas",
        true));

    //===========================================================
    //                         Promocoes                        =
    //===========================================================

    lista.add(Produtos("Combo 2 Pizzas Tradicionais", "Pizzas tamanho grande",
        105.00, "lib/images/promocoes/combo_pizzas.png", "Promoções", true));

    //Nome do produto
    lista.add(Produtos("Casquinha em dobro", "Pague uma casquinha, leve duas",
        5.50, "lib/images/promocoes/casquinha_dobro.png", "Promoções", true));

    //Nome do produto
    lista.add(Produtos(
        "Combo rápido",
        "Uma porção de hamburguinhos, batata frita e salgadinhos",
        30.00,
        "lib/images/promocoes/combo_rapido.png",
        "Promoções",
        true));

    //Nome do produto
    lista.add(Produtos("Dia de praia 01", "Risoto de camarão e batata frita",
        30.00, "lib/images/promocoes/dia_de_praia01.png", "Promoções", true));

    //Nome do produto
    lista.add(Produtos(
        "Dia de praia 02",
        "Risoto de camarão e caranguejo assado",
        30.00,
        "lib/images/promocoes/dia_de_praia02.png",
        "Promoções",
        true));

    //===========================================================
    return lista;
  }
}
 */