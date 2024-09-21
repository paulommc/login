class Carrinho {
  // Instância única da classe (Singleton)
  static final Carrinho _instancia = Carrinho._interno();

  // Lista contendo um Map para armazenar os dados de cada item
  List<Map<String, dynamic>> itens = [];

  // Método fábrica para retornar a mesma instância
  factory Carrinho() {
    return _instancia;
  }

  // Construtor privado
  Carrinho._interno();
}
