class Categoria {
  //atributos
  final String catNome;
  final String catImagem;

  Categoria(this.catNome, this.catImagem);

  static List<Categoria> gerarCategoria() {
    List<Categoria> lista = [];

    //Tradicionais
    lista.add(Categoria(
      "Tradicionais",
      "lib/images/img1.png",
    ));

    //Especiais
    lista.add(Categoria(
      "Especiais",
      "lib/images/img1.png",
    ));

    //Bebidas
    lista.add(Categoria(
      "Bebidas",
      "lib/images/img1.png",
    ));

    //Sobremesas
    lista.add(Categoria(
      "Sobremesas",
      "lib/images/img1.png",
    ));

    //Entradas
    lista.add(Categoria(
      "Entradas",
      "lib/images/img1.png",
    ));

    //Massas
    lista.add(Categoria(
      "Massas",
      "lib/images/img1.png",
    ));

    //Saladas
    lista.add(Categoria(
      "Saladas",
      "lib/images/img1.png",
    ));

    //Promoceos
    lista.add(Categoria(
      "Promoções",
      "lib/images/img1.png",
    ));
    return lista;
  }
}
