// ignore_for_file: empty_constructor_bodies

import 'package:flutter/foundation.dart';

class Categoria {
  //atributos
  final String catNome;
  final String catImagem;

  Categoria(this.catNome, this.catImagem);

  //Modelo novo
  Map<String, dynamic> toJson(){
    return <String, dynamic>{
      'nome' : catNome,
      'imagem' : catImagem,
    };
  }

  factory Categoria.fromJson(Map<String, dynamic> json){
    return Categoria(
      json['nome'],
      json['imagem'],
    );
  }

  //Modelo antigo
  static List<Categoria> gerarCategoria() {
    List<Categoria> lista = [];

    //Tradicionais
    lista.add(Categoria(
      "Tradicionais",
      "lib/images/categorias/tradicionais.png",
    ));

    //Especiais
    lista.add(Categoria(
      "Especiais",
      "lib/images/categorias/especiais.png",
    ));

    //Bebidas
    lista.add(Categoria(
      "Bebidas",
      "lib/images/categorias/bebidas.png",
    ));

    //Sobremesas
    lista.add(Categoria(
      "Sobremesas",
      "lib/images/categorias/sobremesas.png",
    ));

    //Entradas
    lista.add(Categoria(
      "Entradas",
      "lib/images/categorias/entradas.png",
    ));

    //Massas
    lista.add(Categoria(
      "Massas",
      "lib/images/categorias/massas.png",
    ));

    //Saladas
    lista.add(Categoria(
      "Saladas",
      "lib/images/categorias/saladas.png",
    ));

    //Promoceos
    lista.add(Categoria(
      "Promoções",
      "lib/images/categorias/promocoes.png",
    ));
    return lista;
  }
}
