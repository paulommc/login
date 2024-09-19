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

    lista.add(Produtos(
      "Mussarela",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec accumsan laoreet mauris. Nunc maximus nulla at velit pellentesque auctor. Donec non sollicitudin odio. Morbi iaculis vehicula nibh, non lobortis orci tristique in.",
      55.00,
      "lib/images/img1.png",
      "Tradicionais",
    ));
    lista.add(Produtos(
      "Marguerita",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec accumsan laoreet mauris. Nunc maximus nulla at velit pellentesque auctor. Donec non sollicitudin odio. Morbi iaculis vehicula nibh, non lobortis orci tristique in.",
      68.00,
      "lib/images/img1.png",
      "Tradicionais",
    ));
    lista.add(Produtos(
      "Abacaxi",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec accumsan laoreet mauris. Nunc maximus nulla at velit pellentesque auctor. Donec non sollicitudin odio. Morbi iaculis vehicula nibh, non lobortis orci tristique in.",
      55.00,
      "lib/images/img1.png",
      "Especiais",
    ));
    lista.add(Produtos(
      "Água",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec accumsan laoreet mauris. Nunc maximus nulla at velit pellentesque auctor. Donec non sollicitudin odio. Morbi iaculis vehicula nibh, non lobortis orci tristique in.",
      5.00,
      "lib/images/img1.png",
      "Bebidas",
    ));
    return lista;
  }
}
