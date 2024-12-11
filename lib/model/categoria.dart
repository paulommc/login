// ignore_for_file: empty_constructor_bodies

class Categoria {
  final String nome;
  final String descricao;
  final String imagem;

  Categoria(this.nome, this.descricao, this.imagem);

  factory Categoria.fromJson(Map<String, dynamic> json) {
    return Categoria(
      json['nome'] ?? '', // Garante que seja uma string válida
      json['descricao'] ?? '',
      json['imagem'] is String
          ? json['imagem']
          : json['imagem']?.toString() ?? '', // Converte se necessário
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'descricao': descricao,
      'imagem': imagem,
    };
  }
}