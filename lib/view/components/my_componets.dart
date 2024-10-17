// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyComponets {
  AppBar GeraAppBar(String titulo, String tooltip, bool carrinho, BuildContext context){
    return AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.orange,
          ),
        ),
        title: Text(
          titulo,//'Selecione a Categoria'
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: carrinho ? IconButton(
              icon: const Icon(Icons.shopping_cart),
              color: Colors.orange,
              tooltip: tooltip, //'Ver seu pedido' 
              onPressed: () {
                Navigator.pushNamed(context, 'carrinho');
              },
            ): null,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: const Icon(Icons.logout),
              color: Colors.orange,
              tooltip: 'Sair',
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, 'login', (Route<dynamic> route) => false);
              },
            ),
          ),
        ],
      );
  }


}