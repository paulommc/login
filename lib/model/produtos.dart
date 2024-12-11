
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