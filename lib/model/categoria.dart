class Categoria {
  //atributos
  final String catNome;
  final String catImagem;

  Categoria(this.catNome, this.catImagem);

  static List<Categoria> gerarCategoria() {
    List<Categoria> lista = [];

    lista.add(Categoria(
      "Tradicionais",
      "../lib/images/img1.png",
    ));
    lista.add(Categoria(
      "Especiais",
      "../images/img1.png",
    ));
    lista.add(Categoria(
      "Bebidas",
      "images/img1.png",
    ));
    lista.add(Categoria(
      "Sobremesas",
      "images/img1.png",
    ));
    lista.add(Categoria(
      "Entradas",
      "lib/images/img1.png",
    ));
    lista.add(Categoria(
      "Massas",
      "lib/images/img1.png",
    ));
    lista.add(Categoria(
      "Saladas",
      "lib/images/img1.png",
    ));
    lista.add(Categoria(
      "Promoções",
      "lib/images/img1.png",
    ));
    return lista;
  }
}
